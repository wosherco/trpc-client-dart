// trpc_generator_builder.dart

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../trpc_generator.dart';

Builder trpcGeneratorBuilder(BuilderOptions options) {
  final outputDir = options.config['output_dir'] ?? 'lib/generated/';
  final jsonFilePath = options.config['input_json_path'] ??
      options.config['defaultJsonFilePath'];
  final mainKey = options.config['mainKey'] as String? ?? 'routeMap'; 
  if (jsonFilePath == null) {
    throw ArgumentError(
        'TRPC_JSON_PATH environment variable or defaultJsonFilePath must be provided');
  }

  return SharedPartBuilder([TrpcGenerator(jsonFilePath: jsonFilePath, outputDir: outputDir, mainKey: mainKey )], "trpcGeneratorBuilder");
}