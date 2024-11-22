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

A simple trpc client for Dart Applications. It's minimal, just two dependencies (dart's own http library, and [queues](https://pub.dev/packages/queue)). Ideal for flutter apps that use tRPC as a backend.

## Features

- Run Query and Mutate operations against your tRPC server (expressjs, Next.js, Cloudflare Worker, ...)
- Generate bindings from your tRPC router, to have type safety on your queries and mutations. [More info here](https://github.com/wosherco/trpc-client-dart/).

## Usage

You just need to instantiate the `TRPCClient` class with the trpc base endpoint. You can optionally pass headers:

```dart
// Import package
import "package:trpc_client/trpc_client.dart";

// Instantiate the client
final client = TRPCClient(
  baseUri: "https://example.com/trpc",
  headers: {"x-trpc-source": "Dart App"},
);
```

Now you can query, and mutate, with type safety:

```dart
final response = await client.query<Map<String, dynamic>>("route", payload: {"userId": "example"});

if (response.isError) {
  print(response.errors);
} else {
  final data = response.successResponse.data;
}
```

### Usage with Riverpod (Provider)

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
