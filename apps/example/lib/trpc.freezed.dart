// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trpc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HelloInput _$HelloInputFromJson(Map<String, dynamic> json) {
  return _HelloInput.fromJson(json);
}

/// @nodoc
mixin _$HelloInput {
  String get hello => throw _privateConstructorUsedError;

  /// Serializes this HelloInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HelloInputCopyWith<HelloInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelloInputCopyWith<$Res> {
  factory $HelloInputCopyWith(
          HelloInput value, $Res Function(HelloInput) then) =
      _$HelloInputCopyWithImpl<$Res, HelloInput>;
  @useResult
  $Res call({String hello});
}

/// @nodoc
class _$HelloInputCopyWithImpl<$Res, $Val extends HelloInput>
    implements $HelloInputCopyWith<$Res> {
  _$HelloInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hello = null,
  }) {
    return _then(_value.copyWith(
      hello: null == hello
          ? _value.hello
          : hello // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelloInputImplCopyWith<$Res>
    implements $HelloInputCopyWith<$Res> {
  factory _$$HelloInputImplCopyWith(
          _$HelloInputImpl value, $Res Function(_$HelloInputImpl) then) =
      __$$HelloInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hello});
}

/// @nodoc
class __$$HelloInputImplCopyWithImpl<$Res>
    extends _$HelloInputCopyWithImpl<$Res, _$HelloInputImpl>
    implements _$$HelloInputImplCopyWith<$Res> {
  __$$HelloInputImplCopyWithImpl(
      _$HelloInputImpl _value, $Res Function(_$HelloInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hello = null,
  }) {
    return _then(_$HelloInputImpl(
      hello: null == hello
          ? _value.hello
          : hello // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelloInputImpl implements _HelloInput {
  _$HelloInputImpl({required this.hello});

  factory _$HelloInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelloInputImplFromJson(json);

  @override
  final String hello;

  @override
  String toString() {
    return 'HelloInput(hello: $hello)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelloInputImpl &&
            (identical(other.hello, hello) || other.hello == hello));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hello);

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HelloInputImplCopyWith<_$HelloInputImpl> get copyWith =>
      __$$HelloInputImplCopyWithImpl<_$HelloInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelloInputImplToJson(
      this,
    );
  }
}

abstract class _HelloInput implements HelloInput {
  factory _HelloInput({required final String hello}) = _$HelloInputImpl;

  factory _HelloInput.fromJson(Map<String, dynamic> json) =
      _$HelloInputImpl.fromJson;

  @override
  String get hello;

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HelloInputImplCopyWith<_$HelloInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
