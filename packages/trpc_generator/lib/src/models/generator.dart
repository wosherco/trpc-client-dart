import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:trpc_client_annotations/trpc_client_annotations.dart';
import 'package:pool/pool.dart';

class TRPCModelsBuilder extends GeneratorForAnnotation<TrpcGenerator> {
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

    // Validate the router data
    validateRouterData(routes);

    // Generate the header
    StringBuffer output = StringBuffer();

    // Generating Freezed classes for inputs and outputs
    final pool = Pool(10);
    final futures = <Future<StringBuffer>>[];

    for (var subRouteEntry in routes.entries) {
      final route = subRouteEntry.value;
      final String routeName = route['path'].replaceAll('.', '_');

      if (route["input"] != null) {
        final inputSchema = route["input"];
        futures.add(pool.withResource(() => _generateFreezedClass(
            "$classPrefix${routeName}Input", inputSchema)));
      }

      if (route["output"] != null) {
        final outputSchema = route["output"];
        futures.add(pool.withResource(() => _generateFreezedClass(
            "$classPrefix${routeName}Output", outputSchema)));
      }
    }

    // Wait for all generations to complete
    final results = await Future.wait(futures);
    for (final result in results) {
      output.writeln(result.toString());
    }

    // Clean up
    await pool.close();

    return output.toString();
  }

  // Helper method to validate router data
  void validateRouterData(Map<String, dynamic> routerData) {
    if (routerData.isEmpty) {
      throw FormatException('Invalid router data: Data cannot be empty.');
    }
  }

  // Generate Freezed class based on schema
  Future<StringBuffer> _generateFreezedClass(
      String className, Map<String, dynamic>? schema) async {
    StringBuffer output = StringBuffer();

    // Guarantee that the first letter of the class name is capitalized
    className = capitalizeFirstLetter(className);

    try {
      Process quicktype = await Process.start('bunx', [
        'quicktype-wosherco@23.0.174',
        '--lang',
        'dart',
        '--src-lang',
        'schema',
        '-t',
        className,
        '--just-types',
        '--use-freezed'
      ]);

      // Write the schema to stdin and close it
      quicktype.stdin.writeln(json.encode(schema));
      await quicktype.stdin.close();

      // Read the output
      await for (var line in quicktype.stdout
          .transform(utf8.decoder)
          .transform(const LineSplitter())) {
        output.writeln(line);
      }

      // Read any errors
      String errors = await quicktype.stderr.transform(utf8.decoder).join();
      if (errors.isNotEmpty) {
        print('Quicktype errors: $errors');
      }

      // Wait for the process to exit
      int exitCode = await quicktype.exitCode;

      if (exitCode != 0) {
        throw Exception('Quicktype failed with exit code $exitCode');
      }
    } catch (e) {
      print('Error running quicktype: $e');
    }

    return output;
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}
