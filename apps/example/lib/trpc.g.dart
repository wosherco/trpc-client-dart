// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trpc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HelloInputImpl _$$HelloInputImplFromJson(Map<String, dynamic> json) =>
    _$HelloInputImpl(
      hello: json['hello'] as String,
      works: Works.fromJson(json['works'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HelloInputImplToJson(_$HelloInputImpl instance) =>
    <String, dynamic>{
      'hello': instance.hello,
      'works': instance.works,
    };

_$WorksImpl _$$WorksImplFromJson(Map<String, dynamic> json) => _$WorksImpl(
      no: json['no'] as bool,
      yes: json['yes'] as bool,
    );

Map<String, dynamic> _$$WorksImplToJson(_$WorksImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'yes': instance.yes,
    };

_$NestedHello2InputImpl _$$NestedHello2InputImplFromJson(
        Map<String, dynamic> json) =>
    _$NestedHello2InputImpl(
      userId: json['userId'] as String,
      listId: json['listId'] as String,
    );

Map<String, dynamic> _$$NestedHello2InputImplToJson(
        _$NestedHello2InputImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'listId': instance.listId,
    };

_$NestedNestedx2Hello7OutputImpl _$$NestedNestedx2Hello7OutputImplFromJson(
        Map<String, dynamic> json) =>
    _$NestedNestedx2Hello7OutputImpl(
      hello: json['hello'] as bool,
    );

Map<String, dynamic> _$$NestedNestedx2Hello7OutputImplToJson(
        _$NestedNestedx2Hello7OutputImpl instance) =>
    <String, dynamic>{
      'hello': instance.hello,
    };
