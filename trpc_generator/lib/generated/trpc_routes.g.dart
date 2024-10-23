// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trpc_routes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserInputImpl _$$GetUserInputImplFromJson(Map<String, dynamic> json) =>
    _$GetUserInputImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$GetUserInputImplToJson(_$GetUserInputImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$GetUserOutputImpl _$$GetUserOutputImplFromJson(Map<String, dynamic> json) =>
    _$GetUserOutputImpl(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$GetUserOutputImplToJson(_$GetUserOutputImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };

_$CreateUserInputImpl _$$CreateUserInputImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateUserInputImpl(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$CreateUserInputImplToJson(
        _$CreateUserInputImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };

_$CreateUserOutputImpl _$$CreateUserOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateUserOutputImpl(
      success: json['success'] as bool,
    );

Map<String, dynamic> _$$CreateUserOutputImplToJson(
        _$CreateUserOutputImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
    };
