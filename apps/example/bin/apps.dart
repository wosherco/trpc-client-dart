import 'package:trpc_client/trpc_client.dart';
import 'package:trpc_client_example/trpc.dart';

void main() async {
  final client =
      RoutedTrpcClient(TRPCClient(baseUri: "http://localhost:3000/trpc"));

  final test = await client.nested.nestedx2.hello7.query();
  print(test.hello);
}
