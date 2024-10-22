import 'dart:convert';

String serializeInput(dynamic payload, bool urlEncode) {
  final encodedJson = jsonEncode({"json": payload});
  if (urlEncode) {
    return Uri.encodeComponent(encodedJson);
  }
  return encodedJson;
}

String serializeInputBatch(List<dynamic> payload, bool urlEncode) {
  final input = {};

  for (var i = 0; i < payload.length; i++) {
    input["$i"] = {"json": payload[i]};
  }

  final encodedJson = jsonEncode(input);
  if (urlEncode) {
    return Uri.encodeComponent(encodedJson);
  }
  return encodedJson;
}
