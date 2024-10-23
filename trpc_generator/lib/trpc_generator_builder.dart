// trpc_generator_builder.dart

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../trpc_generator.dart';
import 'trpc_annotations.dart';


@TrpcGeneratorAnnotation(jsonFilePath: 'lib/config/routes.json')

Builder trpcGeneratorBuilder(BuilderOptions options) {
  final outputDir = options.config['output_dir'] ?? 'lib/generated/';
  final mainKey = options.config['mainKey'] as String? ?? 'routeMap'; 
  return SharedPartBuilder([TrpcGenerator(outputDir: outputDir, mainKey: mainKey )], "trpcGeneratorBuilder");
}