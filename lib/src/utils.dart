import 'dart:convert';

String serializeQueryInput(dynamic payload) {
  final encodedJson = jsonEncode(payload);
  final urlEncodedeJson = Uri.encodeComponent(encodedJson);
  return urlEncodedeJson;
}

String serializeQueryInputBatch(List<dynamic> payload) {
  final input = {};

  for (var i = 0; i < payload.length; i++) {
    input["$i"] = payload[i];
  }

  final encodedJson = jsonEncode(input);
  final urlEncodedeJson = Uri.encodeComponent(encodedJson);
  return urlEncodedeJson;
}
