import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:trpc_client_annotations/trpc_client_annotations.dart';

class TRPCRoutesBuilder extends GeneratorForAnnotation<TrpcGenerator> {
  final String classPrefix = "";
  final String indentation = "  ";

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    // Get the class name of the current file being processed
    final className = element.name;

    if (className == null) {
      throw FormatException('Invalid router data: Missing class name.');
    }

    String jsonContent;
    if (annotation.read('routesFilePath').isNull) {
      final routerFilePathVariable = annotation.read('routerFilePath');
      final routerVariableNameVariable = annotation.read('routerVariableName');

      if (routerFilePathVariable.isNull) {
        throw FormatException('Invalid router data: Missing routerFilePath.');
      }

      // Using the extractor directly
      try {
        final args = [
          'trpc-extractor@latest',
          '-i',
          routerFilePathVariable.stringValue,
        ];

        if (!routerVariableNameVariable.isNull) {
          args.add('-r');
          args.add(routerVariableNameVariable.stringValue);
        }

        print('Running trpc-extractor with args: ${args.join(' ')}');
        Process trpcExtractor = await Process.start('bunx', args);

        jsonContent = await trpcExtractor.stdout.transform(utf8.decoder).join();

        // Read any errors
        String errors =
            await trpcExtractor.stderr.transform(utf8.decoder).join();
        if (errors.isNotEmpty) {
          print('trpc-extractor errors: $errors');
        }

        // Wait for the process to exit
        int exitCode = await trpcExtractor.exitCode;

        if (exitCode != 0) {
          throw Exception('trpc-extractor failed with exit code $exitCode');
        }
      } catch (e) {
        print('Error running trpc-extractor: $e');
        rethrow;
      }
    } else {
      final routesFilePath = annotation.read('routesFilePath').stringValue;

      // Parse the routes file
      final jsonAssetId = AssetId.resolve(
        Uri.parse(routesFilePath),
        from: buildStep.inputId,
      );

      // Read the JSON file content
      jsonContent = await buildStep.readAsString(jsonAssetId);
    }

    // Parse the JSON content
    final Map<String, dynamic> routerData = json.decode(jsonContent);
    final Map<String, dynamic> routes = routerData["routes"];

    // We need to create nested routes. We will achieve this by creating a class for each route that starts with "R$", and then a new router class for each nested route that contains lazy getters for the routes.
    final Map<String, dynamic> nestedRoutes = {};

    for (var route in routes.entries) {
      final routeName = route.key;

      final splittedRouteName = routeName.split('.');

      // Now we need to save the route name and the route data to the nestedRoutes map recursively Map<String, Map<String, ...>>.
      Map<String, dynamic> currentLevel = nestedRoutes;

      for (int i = 0; i < splittedRouteName.length; i++) {
        final pathPart = splittedRouteName[i];

        if (i == splittedRouteName.length - 1) {
          // We're at the last part, so save the actual route data
          currentLevel[pathPart] = {};
        } else {
          // We're still traversing the path, so create or get the next level map
          currentLevel[pathPart] =
              currentLevel[pathPart] ?? <String, dynamic>{};
          currentLevel = currentLevel[pathPart] as Map<String, dynamic>;
        }
      }
    }

    // Validate the router data
    validateRouterData(routes);

    // Generate the header
    StringBuffer output = StringBuffer();
    _generateRouteClasses(routes, output);

    _generateNestedRouteClasses(nestedRoutes, output);

    return output.toString();
  }

  // Helper method to validate router data
  void validateRouterData(Map<String, dynamic> routerData) {
    if (routerData.isEmpty) {
      throw FormatException('Invalid router data: Data cannot be empty.');
    }
  }

  /// Generates the route classes for the given routes data.
  /// routesData: The routes data to generate the classes for. NOT NESTED ROUTES.
  void _generateRouteClasses(
      Map<String, dynamic> routesData, StringBuffer output) {
    for (var route in routesData.entries) {
      final routeData = route.value;
      final routePath = routeData["path"];
      final routeName = routePath.replaceAll('.', '_');
      final routeType = routeData["routeType"];
      final inputType = routeData['input'] != null
          ? capitalize("$classPrefix${routeName}Input")
          : "void";
      final hasInputData = inputType != "void";
      final outputType = routeData['output'] != null
          ? capitalize("$classPrefix${routeName}Output")
          : "void";
      final hasOutputData = outputType != "void";

      final className = "_R\$${formatRouteName(routeName)}";

      output.writeln();
      output.writeln("class $className {");
      output.writeln("${indentation}final TRPCClient _client;");
      output.writeln("${indentation}const $className(this._client);");

      if (routeType == "mutation") {
        output.writeln(
            "${indentation}Future<$outputType> mutate(${hasInputData ? "$inputType input" : ""}) async {");
        output.writeln(
            "${indentation * 2}final response = await _client.mutate('$routePath'${hasInputData ? ", payload: input.toJson()" : ""});");
        output
            .writeln("${indentation * 2}final returnData = response.unwrap();");

        if (hasOutputData) {
          output.writeln(
              "${indentation * 2}return $outputType.fromJson(returnData);");
        }

        output.writeln("${indentation}}");
      } else if (routeType == "query") {
        output.writeln(
            "${indentation}Future<$outputType> query(${hasInputData ? "$inputType input" : ""}) async {");
        output.writeln(
            "${indentation * 2}final response = await _client.query('$routePath'${hasInputData ? ", payload: input.toJson()" : ""});");
        output
            .writeln("${indentation * 2}final returnData = response.unwrap();");

        if (hasOutputData) {
          output.writeln(
              "${indentation * 2}return $outputType.fromJson(returnData);");
        }

        output.writeln("${indentation}}");
      } else {
        throw FormatException('Invalid route type: ${routeType}');
      }
      output.writeln("}");
    }
  }

  void _generateNestedRouteClasses(
      Map<dynamic, dynamic> nestedRoutes, StringBuffer output,
      {String prefix = ""}) {
    final className = "_RTR\$${prefix}Router";
    output.writeln();
    output.writeln("class $className {");
    output.writeln("${indentation}final TRPCClient _client;");
    output.writeln("${indentation}$className(this._client);");

    for (var route in nestedRoutes.entries) {
      if (route.value.entries.length > 0) {
        output.writeln(
            "${indentation}late final ${route.key} = _RTR\$${prefix}${route.key}_Router(_client);");
      } else {
        output.writeln(
            "${indentation}late final ${route.key} = _R\$${prefix}${route.key}(_client);");
      }
    }

    output.writeln("}");

    for (var route in nestedRoutes.entries) {
      _generateNestedRouteClasses(route.value, output,
          prefix: "${prefix}${route.key}_");
    }
  }

  String formatRouteName(String routeName) {
    return routeName.replaceAll('.', '_');
  }

  String capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }
}
