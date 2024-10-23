class TrpcAnnotations {
  final String jsonFilePath;
  final String packageName;
  final String outputFilePath;
  final List<String> generatedFor;
  final bool generatedFreezed;
  final List<String> freezedGeneratedfor;

  const TrpcAnnotations(
    this.jsonFilePath, {
    this.packageName = 'trpcGenerator',
    this.outputFilePath = 'lib/generated/',
    this.generatedFor = const ['lib/trpc_routes.dart'],
    this.generatedFreezed = false,
    this.freezedGeneratedfor = const ['lib/generated/trpc_routes.dart'],
  });
}
