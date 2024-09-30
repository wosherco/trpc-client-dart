// Import package
import "package:trpc_client/trpc_client.dart";

void main() async {
  // Instantiate the client
  final client = TRPCClient(
    baseUri: "https://example.com/trpc",
    headers: {"x-trpc-source": "Dart App"},
  );

  // Create the mutation request
  final mutation = client.useMutation<Map<String, dynamic>>(
    "route",
    onError: (err) => print("Error: $err"),
    onSuccess: (data) => print("Data: $data"),
  );

  // Run mutation request
  mutation.mutate({"userId": "example"});

  // Run the mutation request and await
  await mutation.mutateAsync({"userId": "example"});
}
