import 'dart:convert';

import 'package:http/http.dart';
import 'trpc_client_base.dart';

TRPCError parseError(dynamic elem) {
  return TRPCError(
    message: elem["error"]["json"]["message"],
    errorCode: TRPCErrorCode.fromJsonRpcCode(elem["error"]["json"]["code"]),
    stack: elem["error"]["json"]["data"]["stack"],
    path: elem["error"]["json"]["data"]["path"],
  );
}

TRPCSuccessfulResponse<DataT> parseSuccess<DataT extends dynamic>(
    dynamic elem) {
  return TRPCSuccessfulResponse<DataT>(elem["result"]["data"]["json"]);
}

TRPCResponse<DataT> parseSingleResponse<DataT extends dynamic>(
  Response response,
) {
  final decodedJson = jsonDecode(utf8.decode(response.bodyBytes));

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return parseSuccess<DataT>(decodedJson);
  }

  final errors = [];
  // Checking if decodedJson is list
  if (decodedJson is! List) {
    errors.add(decodedJson);
  } else {
    errors.addAll(decodedJson);
  }

  return TRPCErrorResponse(errors: errors.map(parseError).toList());
}
