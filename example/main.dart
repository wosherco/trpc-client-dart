// Import package
import "package:trpc_client/trpc_client.dart";

// Instantiate the client
final client = TRPCClient(
  baseUri: "https://example.com/trpc",
  headers: {"x-trpc-source": "Dart App"},
);

void main() async {
  // Run query request
  final response = await client
      .query<Map<String, dynamic>>("route", payload: {"userId": "example"});

  if (response.isError) {
    print(response.errors);
  } else {
    final data = response.successResponse.data;
  }
}
