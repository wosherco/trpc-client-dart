import 'dart:convert';

import 'package:http/http.dart';
import 'package:trpc_client/src/trpc_client_base.dart';

TRPCError parseError(dynamic elem) {
  return TRPCError(
    message: elem["error"]["json"]["message"],
    errorCode: TRPCErrorCode.fromJsonRpcCode(elem["error"]["json"]["code"]),
    stack: elem["error"]["json"]["data"]["stack"],
    path: elem["error"]["json"]["data"]["path"],
  );
}

TRPCSuccessfulResponse parseSuccess<DataT extends dynamic>(dynamic elem) {
  return TRPCSuccessfulResponse<DataT>(elem["result"]["data"]["json"]);
}

TRPCResponse parseSingleResponse<DataT extends dynamic>(
  Response response,
) {
  if (response.statusCode >= 500) {
    throw Exception("Interval Server Error");
  }

  final decodedJson = jsonDecode(response.body);

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
