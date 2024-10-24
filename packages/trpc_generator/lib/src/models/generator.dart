import 'dart:convert';

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

        _generateFreezedClass(
            "$classPrefix${routeName}Input", inputSchema, output);
      }

      if (route["output"] != null) {
        final outputSchema = route["output"];

        _generateFreezedClass(
            "$classPrefix${routeName}Output", outputSchema, output);
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
  void _generateFreezedClass(
      String className, Map<String, dynamic>? schema, StringBuffer output) {
    if (schema != null && schema.containsKey('properties')) {
      output.writeln("@freezed");
      output.writeln(
          "${indentation}class ${capitalizeFirstLetter(className)} with _\$${capitalizeFirstLetter(className)}{");
      output.writeln(
          "${indentation * 2}factory ${capitalizeFirstLetter(className)}({");
      _generateSchemaFields(
          schema['properties'], schema['required'] ?? [], output);
      output.writeln(
          "${indentation * 2}}) = _${capitalizeFirstLetter(className)};");
      output.writeln(
          "${indentation * 2}factory ${capitalizeFirstLetter(className)}.fromJson(Map<String, dynamic> json) => _\$${capitalizeFirstLetter(className)}FromJson(json);");
      output.writeln("$indentation}");
      output.writeln();
    }
  }

  // Generate schema fields
  void _generateSchemaFields(Map<String, dynamic> properties,
      List<dynamic> requiredFields, StringBuffer output) {
    for (var entry in properties.entries) {
      final fieldName = entry.key;
      final fieldSchema = entry.value;
      final fieldType = _zodTypeToDataType(fieldSchema);
      final isRequired = requiredFields.contains(fieldName) ? "required" : "";

      output.writeln("${indentation * 3}$isRequired $fieldType $fieldName,");
    }
  }

  // Map Zod types to Dart types
  String _zodTypeToDataType(Map<String, dynamic> zodType) {
    switch (zodType['type']) {
      case 'string':
        return 'String';
      case 'number':
        return 'double';
      case 'boolean':
        return 'bool';
      case 'array':
        final innerType = _zodTypeToDataType(zodType['items']);
        return 'List<$innerType>';
      case 'object':
        return 'Map<String, dynamic>';
      case 'union':
        return 'dynamic';
      default:
        throw FormatException('Unsupported Zod type: ${zodType['type']}');
    }
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}
