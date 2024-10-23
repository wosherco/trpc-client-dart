// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trpc_routes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserInput _$GetUserInputFromJson(Map<String, dynamic> json) {
  return _GetUserInput.fromJson(json);
}

/// @nodoc
mixin _$GetUserInput {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this GetUserInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserInputCopyWith<GetUserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserInputCopyWith<$Res> {
  factory $GetUserInputCopyWith(
          GetUserInput value, $Res Function(GetUserInput) then) =
      _$GetUserInputCopyWithImpl<$Res, GetUserInput>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetUserInputCopyWithImpl<$Res, $Val extends GetUserInput>
    implements $GetUserInputCopyWith<$Res> {
  _$GetUserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserInputImplCopyWith<$Res>
    implements $GetUserInputCopyWith<$Res> {
  factory _$$GetUserInputImplCopyWith(
          _$GetUserInputImpl value, $Res Function(_$GetUserInputImpl) then) =
      __$$GetUserInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$GetUserInputImplCopyWithImpl<$Res>
    extends _$GetUserInputCopyWithImpl<$Res, _$GetUserInputImpl>
    implements _$$GetUserInputImplCopyWith<$Res> {
  __$$GetUserInputImplCopyWithImpl(
      _$GetUserInputImpl _value, $Res Function(_$GetUserInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetUserInputImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserInputImpl implements _GetUserInput {
  _$GetUserInputImpl({required this.id});

  factory _$GetUserInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserInputImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'GetUserInput(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserInputImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of GetUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserInputImplCopyWith<_$GetUserInputImpl> get copyWith =>
      __$$GetUserInputImplCopyWithImpl<_$GetUserInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserInputImplToJson(
      this,
    );
  }
}

abstract class _GetUserInput implements GetUserInput {
  factory _GetUserInput({required final String id}) = _$GetUserInputImpl;

  factory _GetUserInput.fromJson(Map<String, dynamic> json) =
      _$GetUserInputImpl.fromJson;

  @override
  String get id;

  /// Create a copy of GetUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserInputImplCopyWith<_$GetUserInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetUserOutput _$GetUserOutputFromJson(Map<String, dynamic> json) {
  return _GetUserOutput.fromJson(json);
}

/// @nodoc
mixin _$GetUserOutput {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this GetUserOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserOutputCopyWith<GetUserOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserOutputCopyWith<$Res> {
  factory $GetUserOutputCopyWith(
          GetUserOutput value, $Res Function(GetUserOutput) then) =
      _$GetUserOutputCopyWithImpl<$Res, GetUserOutput>;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class _$GetUserOutputCopyWithImpl<$Res, $Val extends GetUserOutput>
    implements $GetUserOutputCopyWith<$Res> {
  _$GetUserOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserOutputImplCopyWith<$Res>
    implements $GetUserOutputCopyWith<$Res> {
  factory _$$GetUserOutputImplCopyWith(
          _$GetUserOutputImpl value, $Res Function(_$GetUserOutputImpl) then) =
      __$$GetUserOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$$GetUserOutputImplCopyWithImpl<$Res>
    extends _$GetUserOutputCopyWithImpl<$Res, _$GetUserOutputImpl>
    implements _$$GetUserOutputImplCopyWith<$Res> {
  __$$GetUserOutputImplCopyWithImpl(
      _$GetUserOutputImpl _value, $Res Function(_$GetUserOutputImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$GetUserOutputImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserOutputImpl implements _GetUserOutput {
  _$GetUserOutputImpl({required this.name, required this.email});

  factory _$GetUserOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserOutputImplFromJson(json);

  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'GetUserOutput(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserOutputImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of GetUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserOutputImplCopyWith<_$GetUserOutputImpl> get copyWith =>
      __$$GetUserOutputImplCopyWithImpl<_$GetUserOutputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserOutputImplToJson(
      this,
    );
  }
}

abstract class _GetUserOutput implements GetUserOutput {
  factory _GetUserOutput(
      {required final String name,
      required final String email}) = _$GetUserOutputImpl;

  factory _GetUserOutput.fromJson(Map<String, dynamic> json) =
      _$GetUserOutputImpl.fromJson;

  @override
  String get name;
  @override
  String get email;

  /// Create a copy of GetUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserOutputImplCopyWith<_$GetUserOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateUserInput _$CreateUserInputFromJson(Map<String, dynamic> json) {
  return _CreateUserInput.fromJson(json);
}

/// @nodoc
mixin _$CreateUserInput {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this CreateUserInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserInputCopyWith<CreateUserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserInputCopyWith<$Res> {
  factory $CreateUserInputCopyWith(
          CreateUserInput value, $Res Function(CreateUserInput) then) =
      _$CreateUserInputCopyWithImpl<$Res, CreateUserInput>;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class _$CreateUserInputCopyWithImpl<$Res, $Val extends CreateUserInput>
    implements $CreateUserInputCopyWith<$Res> {
  _$CreateUserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserInputImplCopyWith<$Res>
    implements $CreateUserInputCopyWith<$Res> {
  factory _$$CreateUserInputImplCopyWith(_$CreateUserInputImpl value,
          $Res Function(_$CreateUserInputImpl) then) =
      __$$CreateUserInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$$CreateUserInputImplCopyWithImpl<$Res>
    extends _$CreateUserInputCopyWithImpl<$Res, _$CreateUserInputImpl>
    implements _$$CreateUserInputImplCopyWith<$Res> {
  __$$CreateUserInputImplCopyWithImpl(
      _$CreateUserInputImpl _value, $Res Function(_$CreateUserInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$CreateUserInputImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserInputImpl implements _CreateUserInput {
  _$CreateUserInputImpl({required this.name, required this.email});

  factory _$CreateUserInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserInputImplFromJson(json);

  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'CreateUserInput(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserInputImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserInputImplCopyWith<_$CreateUserInputImpl> get copyWith =>
      __$$CreateUserInputImplCopyWithImpl<_$CreateUserInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserInputImplToJson(
      this,
    );
  }
}

abstract class _CreateUserInput implements CreateUserInput {
  factory _CreateUserInput(
      {required final String name,
      required final String email}) = _$CreateUserInputImpl;

  factory _CreateUserInput.fromJson(Map<String, dynamic> json) =
      _$CreateUserInputImpl.fromJson;

  @override
  String get name;
  @override
  String get email;

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserInputImplCopyWith<_$CreateUserInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateUserOutput _$CreateUserOutputFromJson(Map<String, dynamic> json) {
  return _CreateUserOutput.fromJson(json);
}

/// @nodoc
mixin _$CreateUserOutput {
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this CreateUserOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserOutputCopyWith<CreateUserOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserOutputCopyWith<$Res> {
  factory $CreateUserOutputCopyWith(
          CreateUserOutput value, $Res Function(CreateUserOutput) then) =
      _$CreateUserOutputCopyWithImpl<$Res, CreateUserOutput>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$CreateUserOutputCopyWithImpl<$Res, $Val extends CreateUserOutput>
    implements $CreateUserOutputCopyWith<$Res> {
  _$CreateUserOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserOutputImplCopyWith<$Res>
    implements $CreateUserOutputCopyWith<$Res> {
  factory _$$CreateUserOutputImplCopyWith(_$CreateUserOutputImpl value,
          $Res Function(_$CreateUserOutputImpl) then) =
      __$$CreateUserOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$CreateUserOutputImplCopyWithImpl<$Res>
    extends _$CreateUserOutputCopyWithImpl<$Res, _$CreateUserOutputImpl>
    implements _$$CreateUserOutputImplCopyWith<$Res> {
  __$$CreateUserOutputImplCopyWithImpl(_$CreateUserOutputImpl _value,
      $Res Function(_$CreateUserOutputImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$CreateUserOutputImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserOutputImpl implements _CreateUserOutput {
  _$CreateUserOutputImpl({required this.success});

  factory _$CreateUserOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserOutputImplFromJson(json);

  @override
  final bool success;

  @override
  String toString() {
    return 'CreateUserOutput(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserOutputImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  /// Create a copy of CreateUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserOutputImplCopyWith<_$CreateUserOutputImpl> get copyWith =>
      __$$CreateUserOutputImplCopyWithImpl<_$CreateUserOutputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserOutputImplToJson(
      this,
    );
  }
}

abstract class _CreateUserOutput implements CreateUserOutput {
  factory _CreateUserOutput({required final bool success}) =
      _$CreateUserOutputImpl;

  factory _CreateUserOutput.fromJson(Map<String, dynamic> json) =
      _$CreateUserOutputImpl.fromJson;

  @override
  bool get success;

  /// Create a copy of CreateUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserOutputImplCopyWith<_$CreateUserOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
