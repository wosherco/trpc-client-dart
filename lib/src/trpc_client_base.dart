import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trpc_client/src/parser.dart';
import 'package:trpc_client/src/utils.dart';

class InvalidOperationException implements Exception {
  const InvalidOperationException();

  @override
  String toString() => 'InvalidOperationException';
}

enum TRPCErrorCode {
  PARSE_ERROR(errorCode: "PARSE_ERROR", httpCode: 400, jsonRpcCode: -32700),
  BAD_REQUEST(errorCode: "BAD_REQUEST", httpCode: 400, jsonRpcCode: -32600),
  UNAUTHORIZED(errorCode: "UNAUTHORIZED", httpCode: 401, jsonRpcCode: -32001),
  NOT_FOUND(errorCode: "NOT_FOUND", httpCode: 404, jsonRpcCode: -32004),
  FORBIDDEN(errorCode: "FORBIDDEN", httpCode: 403, jsonRpcCode: -32003),
  METHOD_NOT_SUPPORTED(
      errorCode: "METHOD_NOT_SUPPORTED", httpCode: 405, jsonRpcCode: -32005),
  TIMEOUT(errorCode: "TIMEOUT", httpCode: 408, jsonRpcCode: -32008),
  CONFLICT(errorCode: "CONFLICT", httpCode: 409, jsonRpcCode: -32009),
  PRECONDITION_FAILED(
      errorCode: "PRECONDITION_FAILED", httpCode: 412, jsonRpcCode: -32012),
  PAYLOAD_TOO_LARGE(
      errorCode: "PAYLOAD_TOO_LARGE", httpCode: 413, jsonRpcCode: -32013),
  UNPROCESSABLE_CONTENT(
      errorCode: "UNPROCESSABLE_CONTENT", httpCode: 422, jsonRpcCode: -32022),
  TOO_MANY_REQUESTS(
      errorCode: "TOO_MANY_REQUESTS", httpCode: 429, jsonRpcCode: -32029),
  CLIENT_CLOSED_REQUEST(
      errorCode: "CLIENT_CLOSED_REQUEST", httpCode: 499, jsonRpcCode: -32099),
  INTERNAL_SERVER_ERROR(
      errorCode: "INTERNAL_SERVER_ERROR", httpCode: 500, jsonRpcCode: -32603),
  NOT_IMPLEMENTED(
      errorCode: "NOT_IMPLEMENTED", httpCode: 501, jsonRpcCode: -32603);

  const TRPCErrorCode({
    required this.errorCode,
    required this.httpCode,
    required this.jsonRpcCode,
  });

  final int httpCode;
  final int jsonRpcCode;
  final String errorCode;

  static TRPCErrorCode fromJsonRpcCode(int code) {
    switch (code) {
      case -32700:
        return TRPCErrorCode.PARSE_ERROR;
      case -32600:
        return TRPCErrorCode.BAD_REQUEST;
      case -32001:
        return TRPCErrorCode.UNAUTHORIZED;
      case -32004:
        return TRPCErrorCode.NOT_FOUND;
      case -32003:
        return TRPCErrorCode.FORBIDDEN;
      case -32005:
        return TRPCErrorCode.METHOD_NOT_SUPPORTED;
      case -32008:
        return TRPCErrorCode.TIMEOUT;
      case -32009:
        return TRPCErrorCode.CONFLICT;
      case -32012:
        return TRPCErrorCode.PRECONDITION_FAILED;
      case -32013:
        return TRPCErrorCode.PAYLOAD_TOO_LARGE;
      case -32022:
        return TRPCErrorCode.UNPROCESSABLE_CONTENT;
      case -32029:
        return TRPCErrorCode.TOO_MANY_REQUESTS;
      case -32099:
        return TRPCErrorCode.CLIENT_CLOSED_REQUEST;
      case -32603:
        return TRPCErrorCode.INTERNAL_SERVER_ERROR;
      default:
        return TRPCErrorCode.NOT_IMPLEMENTED;
    }
  }
}

abstract class TRPCResponse<DataT extends dynamic> {
  final bool isError;

  const TRPCResponse({required this.isError});

  List<TRPCError> get errors => this.isError
      ? (this as TRPCErrorResponse).errors
      : throw InvalidOperationException();

  TRPCSuccessfulResponse<DataT> get successResponse => !this.isError
      ? (this as TRPCSuccessfulResponse<DataT>)
      : throw InvalidOperationException();
}

class TRPCSuccessfulResponse<DataT extends dynamic>
    extends TRPCResponse<DataT> {
  final DataT data;

  const TRPCSuccessfulResponse(this.data) : super(isError: false);
}

class TRPCErrorResponse<DataT extends dynamic> extends TRPCResponse<DataT> {
  @override
  final List<TRPCError> errors;

  const TRPCErrorResponse({
    required this.errors,
  }) : super(isError: true);
}

class TRPCError {
  final String message;
  final TRPCErrorCode errorCode;
  final String stack;
  final String path;

  const TRPCError(
      {required this.message,
      required this.errorCode,
      required this.stack,
      required this.path});

  int get httpCode => this.errorCode.httpCode;

  int get jsonRpcCode => this.errorCode.jsonRpcCode;
}

class TRPCException implements Exception {
  final TRPCError error;

  const TRPCException(this.error);

  @override
  String toString() {
    return "TRPCException: ${error.message}";
  }
}

class TRPCClient {
  String baseUri;
  Map<String, String>? headers;

  TRPCClient({required String baseUri, this.headers})
      : baseUri = baseUri.endsWith("/")
            ? baseUri.substring(0, baseUri.length - 1)
            : baseUri;

  TRPCResponse<T> _errorRespose<T extends dynamic>() {
    return TRPCErrorResponse(
      errors: [
        TRPCError(
          message: "Interval Server Error",
          errorCode: TRPCErrorCode.INTERNAL_SERVER_ERROR,
          stack: "",
          path: "",
        ),
      ],
    );
  }

  Future<TRPCResponse<DataT>> query<DataT extends dynamic>(String route,
      {dynamic payload}) {
    final isPayload = payload != null;

    String url = "$baseUri/$route";
    if (isPayload) {
      url += "?input=${serializeQueryInput(payload)}";
    }

    return http
        .get(Uri.parse(url), headers: this.headers)
        .then(parseSingleResponse<DataT>)
        .catchError((error) => _errorRespose<DataT>());
  }

  Future<TRPCResponse<DataT>> mutate<DataT extends dynamic>(String route,
      {dynamic payload}) {
    final encodedPayload = payload == null ? null : jsonEncode(payload);
    final uri = Uri.parse("$baseUri/$route");

    return http
        .post(
          uri,
          headers: this.headers,
          body: encodedPayload,
        )
        .then(parseSingleResponse<DataT>)
        .catchError((error) => _errorRespose<DataT>());
  }
}
