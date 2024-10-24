// Import package
import "../lib/trpc_client.dart";

void main() async {
  // Instantiate the client
  final client = TRPCClient(
    baseUri: "https://example.com/trpc",
    headers: {"x-trpc-source": "Dart App"},
  );

  // Run query request
  final response = await client
      .query<Map<String, dynamic>>("route", payload: {"userId": "example"});

  if (response.isError) {
    print(response.errors);
  } else {
    final data = response.successResponse.data;
  }

  // If you want to just get the data and throw an error if there is one
  final data = response.unwrap();
}
