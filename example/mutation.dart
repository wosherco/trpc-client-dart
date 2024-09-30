// Import package
import "package:trpc_client/trpc_client.dart";

void main() async {
  // Instantiate the client
  final client = TRPCClient(
    baseUri: "https://example.com/trpc",
    headers: {"x-trpc-source": "Dart App"},
  );

  // Run mutation request
  final mutationResponse = await client.mutate<Map<String, dynamic>>(
    "route",
    payload: {"userId": "example"},
  );

  if (mutationResponse.isError) {
    print(mutationResponse.errors);
  } else {
    final data = mutationResponse.successResponse.data;
  }

  // If you want to just get the data and throw an error if there is one
  final mutationData = mutationResponse.unwrap();
}
