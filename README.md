# Dart TRPC Client

> With routes and types generated from TRPC Typescript.

## Packages

- [trpc_client](./trpc_client)
- [trpc_annotations](./trpc_annotations)
- [trpc_generator](./trpc_generator)

## tRPC Generator

To generate the bindings from your tRPC Router, to be able to generate type-safe queries and mutations, you will need to have a script on your tRPC router's `package.json` that runs the generator. You can check [this example](./apps/trpc-server/package.json)

```bash
bunx trpc-extractor -i src/router.ts -o ../example/lib/routes.json -w
```

Once the json with all the routes is generated, you will need to install a few dependencies on your flutter/dart project:

```yaml
dependencies:
  trpc_client: ^0.4.0
  trpc_client_annotations: ^0.1.1

dev_dependencies:
  build_runner: ^2.4.13
  trpc_client_generator: ^0.1.2
```

Then, create a file on your project to run the generator:

[trpc.dart](./apps/example/lib/trpc.dart)

```dart
import 'package:trpc_client_annotations/trpc_client_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trpc_client/trpc_client.dart';

part 'trpc.freezed.dart';
part 'trpc.models.dart';
part 'trpc.router.dart';
part 'trpc.g.dart';

@TrpcGenerator(routesFilePath: "routes.json")
class RoutedTrpcClient extends _RTR$Router {
  RoutedTrpcClient(super.client);
}
```

> Or using the typescript file that contains the router directly:
>
> ```dart
> import 'package:trpc_client_annotations/trpc_client_annotations.dart';
> import 'package:freezed_annotation/freezed_annotation.dart';
> import 'package:trpc_client/trpc_client.dart';
>
> part 'trpc.freezed.dart';
> part 'trpc.models.dart';
> part 'trpc.router.dart';
> part 'trpc.g.dart';
>
> @TrpcGenerator(routerFilePath: "../trpc-server/src/router.ts")
> class RoutedTrpcClient extends _RTR$Router {
>   RoutedTrpcClient(super.client);
> }
> ```

Finally, run the generator:

```bash
flutter pub run build_runner build -d
```

or, if developing and want to see the changes on the fly:

```bash
flutter pub run build_runner watch -d
```
