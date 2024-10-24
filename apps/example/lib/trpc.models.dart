// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
/// This file is generated by trpc_client_generator.

part of 'trpc.dart';

// **************************************************************************
// Generator: TRPCModelsBuilder
// **************************************************************************

@freezed
class HelloInput with _$HelloInput {
  factory HelloInput({
    required String hello,
  }) = _HelloInput;
  factory HelloInput.fromJson(Map<String, dynamic> json) =>
      _$HelloInputFromJson(json);
}

@freezed
class Nested_nestedx2_hello7Output with _$Nested_nestedx2_hello7Output {
  factory Nested_nestedx2_hello7Output({
    required bool hello,
  }) = _Nested_nestedx2_hello7Output;
  factory Nested_nestedx2_hello7Output.fromJson(Map<String, dynamic> json) =>
      _$Nested_nestedx2_hello7OutputFromJson(json);
}
