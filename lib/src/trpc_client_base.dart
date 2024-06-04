import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:queue/queue.dart';
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
  http.Client client;
  String baseUri;
  Map<String, String>? headers;

  TRPCClient({required String baseUri, this.headers, http.Client? client})
      : client = client ?? http.Client(),
        baseUri = baseUri.endsWith("/")
            ? baseUri.substring(0, baseUri.length - 1)
            : baseUri;

  TRPCResponse<T> _errorRespose<T extends dynamic>() {
    return TRPCErrorResponse(
      errors: [
        TRPCError(
          message: "Internal Client Error",
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
      url += "?input=${serializeInput(payload, true)}";
    }

    return client
        .get(Uri.parse(url), headers: this.headers)
        .then(parseSingleResponse<DataT>)
        .catchError((error) => _errorRespose<DataT>());
  }

  Future<TRPCResponse<DataT>> mutate<DataT extends dynamic>(String route,
      {dynamic payload}) {
    final mutateInstance = useMutation<DataT>(route);

    return mutateInstance.mutateAsync(payload);
  }

  TRPCMutationClient<DataT> useMutation<DataT extends dynamic>(
    String route, {
    ContextCallbackType? onSuccess,
    ContextCallbackType? onError,
  }) {
    final headers = this.headers ?? {};
    headers["Content-Type"] = "application/json";

    final uri = Uri.parse("$baseUri/$route");

    return TRPCMutationClient<DataT>._(this.client, uri, headers);
  }
}

class TRPCMutationContext<DataT, PayloadT> {
  PayloadT payload;
  TRPCResponse<DataT> response;

  TRPCMutationContext._(this.payload, this.response);
}

typedef ContextCallbackType<DataT> = FutureOr<void> Function(
    TRPCMutationContext<DataT, dynamic> context);

class TRPCMutationClient<DataT extends dynamic> {
  http.Client client;
  Uri uri;
  Map<String, String> headers;
  ContextCallbackType<DataT>? onSuccess;
  ContextCallbackType<DataT>? onError;

  TRPCResponse<DataT>? _latestResponse;

  Queue concurrencyQueue = Queue();
  int _queueLength = 0;

  TRPCMutationClient._(
    this.client,
    this.uri,
    this.headers, {
    this.onSuccess,
    this.onError,
  });

  Future<TRPCResponse<DataT>> _runMutate(dynamic payload) async {
    final req = await client.post(
      uri,
      headers: headers,
      body: serializeInput(payload, false),
    );

    final res = parseSingleResponse<DataT>(req);
    _latestResponse = res;

    final context = TRPCMutationContext._(payload, res);

    if (res.isError && this.onError != null) {
      this.onError!(context);
    } else if (!res.isError && this.onSuccess != null) {
      this.onSuccess!(context);
    }

    _queueLength--;

    return res;
  }

  void mutate(dynamic payload) {
    _queueLength++;
    concurrencyQueue.add(() async => _runMutate(payload));
  }

  Future<TRPCResponse<DataT>> mutateAsync(dynamic payload) {
    _queueLength++;
    return concurrencyQueue.add(() async => _runMutate(payload));
  }

  bool get isIdle => _queueLength == 0;
  bool get isLoading => _queueLength != 0;
  bool get isError => _latestResponse?.isError ?? false;
  bool get isSuccess => !(_latestResponse?.isError ?? true);
}
