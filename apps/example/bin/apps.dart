import 'package:trpc_client/trpc_client.dart';
import 'package:trpc_client_example/trpc.dart';

void main() {
  final client = RoutedTrpcClient(TRPCClient(baseUri: "http://localhost:3000"));

  client.hello.mutate(HelloInput(hello: "hola"));
}
