import 'package:trpc_client/trpc_client.dart';
import 'package:trpc_client_example/trpc.dart';

void main() async {
  final client = RoutedTrpcClient(TRPCClient(baseUri: "http://localhost:3000"));

  final test = await client.nested.nestedx2.hello7.mutate();
  print(test.hello);
}
