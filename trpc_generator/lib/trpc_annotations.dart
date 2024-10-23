class TrpcAnnotations {
  final String jsonFilePath;
  final String packageName;
  final String outputFilePath;
  final List<String> generatedFor;

  const TrpcAnnotations(
    this.jsonFilePath, {
    this.packageName = 'trpcGenerator',
    this.outputFilePath = 'lib/generated/',
    this.generatedFor = const [],
  });
}
