// class TrpcAnnotations {
//   final String jsonFilePath;
//   final String packageName;
//   final String outputFilePath;
//   final List<String> generatedFor;
//   final bool generatedFreezed;
//   final List<String> freezedGeneratedfor;

//   const TrpcAnnotations(
//     this.jsonFilePath, {
//     this.packageName = 'trpcGenerator',
//     this.outputFilePath = 'lib/generated/',
//     this.generatedFor = const ['lib/trpc_routes.dart'],
//     this.generatedFreezed = false,
//     this.freezedGeneratedfor = const ['lib/generated/trpc_routes.dart'],
//   });
// }
class TrpcBuilderConfig {
  final String outputDir;
  final String inputJsonPath;
  final String defaultJsonFilePath;
  final String mainKey;
  final List<String> generateFor;
  final bool generateForAllRoutes;
  final String classPrefix;
  final String indentation;

  

  const TrpcBuilderConfig({
    required this.outputDir,
    required this.inputJsonPath,
    required this.defaultJsonFilePath,
    required this.mainKey,
    required this.generateFor,
    this.generateForAllRoutes = true, // default value
    this.classPrefix = '', // default value
    this.indentation = '  ', // default value
    
  });
}

