<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# trpc_client

A simple trpc client for Dart Applications. It's minimal, dependency-free (only depends on dart's own http library), and works perfectly with flutter.

## Features

- Run Query and Mutate operations against your tRPC server (expressjs, Next.js, Cloudflare Worker, ...)

## Usage

You just need to instantiate the `TRPCClient` class with the trpc base endpoint. You can optionally pass headers:

```dart
final client = TRPCClient(
  baseUri: "https://example.com/trpc",
  headers: {"x-trpc-source": "Dart App"},
);
```

I recommend using it with riverpod, to make authentication easier:

```dart
@riverpod
TRPCClient trpcClient(TrpcClientRef ref) {
  final sessionId = ref.watch(sessionIdProvider);

  final client = TRPCClient(
    baseUri: "https://example.com/trpc",
    headers: {"Authorization": "Bearer $sessionId"},
  );

  return client;
}
```

## Additional information

### TOOD

- [ ] Better README.md
- [ ] Support for batching
- [ ] Write tests with real tRPC server
- [ ] Linter Rules
- [ ] Docs?
- [ ] Somehow generate definitions from ts?

PR's are welcome :D
