import 'package:trpc_client_annotations/trpc_client_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trpc_client/trpc_client.dart';

part 'trpc.freezed.dart';
part 'trpc.models.dart';
part 'trpc.router.dart';
part 'trpc.g.dart';

// @TrpcGenerator(routesFilePath: "routes.json")
// class RoutedTrpcClient extends _RTR$Router {
//   RoutedTrpcClient(super.client);
// }

@TrpcGenerator(routerFilePath: "../trpc-server/src/router.ts")
class RoutedTrpcClient extends _RTR$Router {
  RoutedTrpcClient(super.client);
}
