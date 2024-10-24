import '../lib/src/parser.dart';
import '../lib/src/utils.dart';
import '../lib/trpc_client.dart';
import 'package:test/test.dart';

void main() {
  group('Query input serialization', () {
    test('JSON parsing', () {
      expect(serializeInput({"testing": true, "userId": "userId"}, true),
          "%7B%22json%22%3A%7B%22testing%22%3Atrue%2C%22userId%22%3A%22userId%22%7D%7D");
    });

    test('String parsing', () {
      expect(
          serializeInput("Testing", true), "%7B%22json%22%3A%22Testing%22%7D");
    });
  });

  group('Batch Query input serialization', () {
    test('tRPC Example', () {
      expect(serializeInputBatch(["1", "2"], true),
          "%7B%220%22%3A%7B%22json%22%3A%221%22%7D%2C%221%22%3A%7B%22json%22%3A%222%22%7D%7D");
    });

    test('Complex parsing', () {
      expect(
          serializeInputBatch([
            {"userId": 69, "page": 1, "offset": "alot"},
            {"userId": -1, "page": 999}
          ], true),
          "%7B%220%22%3A%7B%22json%22%3A%7B%22userId%22%3A69%2C%22page%22%3A1%2C%22offset%22%3A%22alot%22%7D%7D%2C%221%22%3A%7B%22json%22%3A%7B%22userId%22%3A-1%2C%22page%22%3A999%7D%7D%7D");
    });
  });

  group('Mutation input serialization', () {
    test('JSON parsing', () {
      expect(serializeInput({"testing": true, "userId": "userId"}, false),
          '{"json":{"testing":true,"userId":"userId"}}');
    });

    test('String parsing', () {
      expect(serializeInput("Testing", false), '{"json":"Testing"}');
    });
  });

  group('Batch Mutation input serialization', () {
    test('tRPC Example', () {
      expect(serializeInputBatch(["1", "2"], false),
          '{"0":{"json":"1"},"1":{"json":"2"}}');
    });

    test('Complex parsing', () {
      expect(
          serializeInputBatch([
            {"userId": 69, "page": 1, "offset": "alot"},
            {"userId": -1, "page": 999}
          ], false),
          '{"0":{"json":{"userId":69,"page":1,"offset":"alot"}},"1":{"json":{"userId":-1,"page":999}}}');
    });
  });

  group('Error response parser', () {
    test('tRPC Example', () {
      identical(
        parseError({
          "error": {
            "json": {
              "message": "Something went wrong",
              "code": -32600, // JSON-RPC 2.0 code
              "data": {
                // Extra, customizable, meta data
                "code": "INTERNAL_SERVER_ERROR",
                "httpStatus": 500,
                "stack": "...",
                "path": "post.add"
              }
            }
          }
        }),
        TRPCError(
          message: "Something went wrong",
          errorCode: TRPCErrorCode.INTERNAL_SERVER_ERROR,
          stack: "...",
          path: "post.add",
        ),
      );
    });
  });

  group('Success response parser', () {
    test('tRPC Example', () {
      identical(
        parseSuccess({
          "result": {
            "data": {"id": "1", "title": "Hello tRPC", "body": "..."}
          }
        }),
        TRPCSuccessfulResponse(
            {"id": "1", "title": "Hello tRPC", "body": "..."}),
      );
    });
  });
}
