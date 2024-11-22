import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:trpc_client_annotations/trpc_client_annotations.dart';

class TRPCModelsBuilder extends GeneratorForAnnotation<TrpcGenerator> {
  final String classPrefix = "";
  final String indentation = "  ";

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final routesFilePath = annotation.read('routesFilePath').stringValue;

    // Get the class name of the current file being processed
    final className = element.name;

    if (className == null) {
      throw FormatException('Invalid router data: Missing class name.');
    }

    // Parse the routes file
    final jsonAssetId = AssetId.resolve(
      Uri.parse(routesFilePath),
      from: buildStep.inputId,
    );

    // Read the JSON file content
    String jsonContent = await buildStep.readAsString(jsonAssetId);

    // Parse the JSON content
    final Map<String, dynamic> routerData = json.decode(jsonContent);

    // Validate the router data
    validateRouterData(routerData);

    // Generate the header
    StringBuffer output = StringBuffer();

    // Generating Freezed classes for inputs and outputs
    for (var subRouteEntry in routerData.entries) {
      final route = subRouteEntry.value;
      final String routeName = route['path'].replaceAll('.', '_');

      if (route["input"] != null) {
        final inputSchema = route["input"];

        final classOutput = await _generateFreezedClass(
            "$classPrefix${routeName}Input", inputSchema);

        output.writeln(classOutput.toString());
      }

      if (route["output"] != null) {
        final outputSchema = route["output"];

        final classOutput = await _generateFreezedClass(
            "$classPrefix${routeName}Output", outputSchema);

        output.writeln(classOutput.toString());
      }
    }

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
        'quicktype-wosherco@23.0.171-fix4',
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
