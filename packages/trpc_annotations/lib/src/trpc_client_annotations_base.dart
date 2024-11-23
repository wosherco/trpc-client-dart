class TrpcGenerator {
  /// The path to the json routes file. If provided, you can ignore the [routerFilePath] and [routerVariableName].
  final String? routesFilePath;

  /// The path to the typescript router file. If provided, you can ignore the [routesFilePath]. You can also provide a custom variable name for the router.
  final String? routerFilePath;

  /// Variable of the router. Only use if [routerFilePath] is provided
  final String? routerVariableName;

  const TrpcGenerator({
    this.routesFilePath,
    this.routerFilePath,
    this.routerVariableName,
  });
}
