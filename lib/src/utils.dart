import 'dart:convert';

String serializeQueryInput(dynamic payload) {
  final encodedJson = jsonEncode({"json": payload});
  final urlEncodedeJson = Uri.encodeComponent(encodedJson);
  return urlEncodedeJson;
}

String serializeQueryInputBatch(List<dynamic> payload) {
  final input = {};

  for (var i = 0; i < payload.length; i++) {
    input["$i"] = {"json": payload[i]};
  }

  final encodedJson = jsonEncode(input);
  final urlEncodedeJson = Uri.encodeComponent(encodedJson);
  return urlEncodedeJson;
}
