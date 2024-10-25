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

/// @nodoc
mixin _$HelloInput {
  String get hello => throw _privateConstructorUsedError;
  Works get works => throw _privateConstructorUsedError;

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
  $Res call({String hello, Works works});

  $WorksCopyWith<$Res> get works;
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
    Object? works = null,
  }) {
    return _then(_value.copyWith(
      hello: null == hello
          ? _value.hello
          : hello // ignore: cast_nullable_to_non_nullable
              as String,
      works: null == works
          ? _value.works
          : works // ignore: cast_nullable_to_non_nullable
              as Works,
    ) as $Val);
  }

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorksCopyWith<$Res> get works {
    return $WorksCopyWith<$Res>(_value.works, (value) {
      return _then(_value.copyWith(works: value) as $Val);
    });
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
  $Res call({String hello, Works works});

  @override
  $WorksCopyWith<$Res> get works;
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
    Object? works = null,
  }) {
    return _then(_$HelloInputImpl(
      hello: null == hello
          ? _value.hello
          : hello // ignore: cast_nullable_to_non_nullable
              as String,
      works: null == works
          ? _value.works
          : works // ignore: cast_nullable_to_non_nullable
              as Works,
    ));
  }
}

/// @nodoc

class _$HelloInputImpl implements _HelloInput {
  const _$HelloInputImpl({required this.hello, required this.works});

  @override
  final String hello;
  @override
  final Works works;

  @override
  String toString() {
    return 'HelloInput(hello: $hello, works: $works)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelloInputImpl &&
            (identical(other.hello, hello) || other.hello == hello) &&
            (identical(other.works, works) || other.works == works));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hello, works);

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HelloInputImplCopyWith<_$HelloInputImpl> get copyWith =>
      __$$HelloInputImplCopyWithImpl<_$HelloInputImpl>(this, _$identity);
}

abstract class _HelloInput implements HelloInput {
  const factory _HelloInput(
      {required final String hello,
      required final Works works}) = _$HelloInputImpl;

  @override
  String get hello;
  @override
  Works get works;

  /// Create a copy of HelloInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HelloInputImplCopyWith<_$HelloInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Works {
  bool get no => throw _privateConstructorUsedError;
  bool get yes => throw _privateConstructorUsedError;

  /// Create a copy of Works
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorksCopyWith<Works> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksCopyWith<$Res> {
  factory $WorksCopyWith(Works value, $Res Function(Works) then) =
      _$WorksCopyWithImpl<$Res, Works>;
  @useResult
  $Res call({bool no, bool yes});
}

/// @nodoc
class _$WorksCopyWithImpl<$Res, $Val extends Works>
    implements $WorksCopyWith<$Res> {
  _$WorksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Works
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? yes = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as bool,
      yes: null == yes
          ? _value.yes
          : yes // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorksImplCopyWith<$Res> implements $WorksCopyWith<$Res> {
  factory _$$WorksImplCopyWith(
          _$WorksImpl value, $Res Function(_$WorksImpl) then) =
      __$$WorksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool no, bool yes});
}

/// @nodoc
class __$$WorksImplCopyWithImpl<$Res>
    extends _$WorksCopyWithImpl<$Res, _$WorksImpl>
    implements _$$WorksImplCopyWith<$Res> {
  __$$WorksImplCopyWithImpl(
      _$WorksImpl _value, $Res Function(_$WorksImpl) _then)
      : super(_value, _then);

  /// Create a copy of Works
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? yes = null,
  }) {
    return _then(_$WorksImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as bool,
      yes: null == yes
          ? _value.yes
          : yes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WorksImpl implements _Works {
  const _$WorksImpl({required this.no, required this.yes});

  @override
  final bool no;
  @override
  final bool yes;

  @override
  String toString() {
    return 'Works(no: $no, yes: $yes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorksImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.yes, yes) || other.yes == yes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, no, yes);

  /// Create a copy of Works
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorksImplCopyWith<_$WorksImpl> get copyWith =>
      __$$WorksImplCopyWithImpl<_$WorksImpl>(this, _$identity);
}

abstract class _Works implements Works {
  const factory _Works({required final bool no, required final bool yes}) =
      _$WorksImpl;

  @override
  bool get no;
  @override
  bool get yes;

  /// Create a copy of Works
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorksImplCopyWith<_$WorksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NestedHello2Input {
  String get userId => throw _privateConstructorUsedError;
  String get listId => throw _privateConstructorUsedError;

  /// Create a copy of NestedHello2Input
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NestedHello2InputCopyWith<NestedHello2Input> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedHello2InputCopyWith<$Res> {
  factory $NestedHello2InputCopyWith(
          NestedHello2Input value, $Res Function(NestedHello2Input) then) =
      _$NestedHello2InputCopyWithImpl<$Res, NestedHello2Input>;
  @useResult
  $Res call({String userId, String listId});
}

/// @nodoc
class _$NestedHello2InputCopyWithImpl<$Res, $Val extends NestedHello2Input>
    implements $NestedHello2InputCopyWith<$Res> {
  _$NestedHello2InputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NestedHello2Input
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? listId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NestedHello2InputImplCopyWith<$Res>
    implements $NestedHello2InputCopyWith<$Res> {
  factory _$$NestedHello2InputImplCopyWith(_$NestedHello2InputImpl value,
          $Res Function(_$NestedHello2InputImpl) then) =
      __$$NestedHello2InputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String listId});
}

/// @nodoc
class __$$NestedHello2InputImplCopyWithImpl<$Res>
    extends _$NestedHello2InputCopyWithImpl<$Res, _$NestedHello2InputImpl>
    implements _$$NestedHello2InputImplCopyWith<$Res> {
  __$$NestedHello2InputImplCopyWithImpl(_$NestedHello2InputImpl _value,
      $Res Function(_$NestedHello2InputImpl) _then)
      : super(_value, _then);

  /// Create a copy of NestedHello2Input
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? listId = null,
  }) {
    return _then(_$NestedHello2InputImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NestedHello2InputImpl implements _NestedHello2Input {
  const _$NestedHello2InputImpl({required this.userId, required this.listId});

  @override
  final String userId;
  @override
  final String listId;

  @override
  String toString() {
    return 'NestedHello2Input(userId: $userId, listId: $listId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NestedHello2InputImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.listId, listId) || other.listId == listId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, listId);

  /// Create a copy of NestedHello2Input
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NestedHello2InputImplCopyWith<_$NestedHello2InputImpl> get copyWith =>
      __$$NestedHello2InputImplCopyWithImpl<_$NestedHello2InputImpl>(
          this, _$identity);
}

abstract class _NestedHello2Input implements NestedHello2Input {
  const factory _NestedHello2Input(
      {required final String userId,
      required final String listId}) = _$NestedHello2InputImpl;

  @override
  String get userId;
  @override
  String get listId;

  /// Create a copy of NestedHello2Input
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NestedHello2InputImplCopyWith<_$NestedHello2InputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NestedNestedx2Hello7Output {
  bool get hello => throw _privateConstructorUsedError;

  /// Create a copy of NestedNestedx2Hello7Output
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NestedNestedx2Hello7OutputCopyWith<NestedNestedx2Hello7Output>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedNestedx2Hello7OutputCopyWith<$Res> {
  factory $NestedNestedx2Hello7OutputCopyWith(NestedNestedx2Hello7Output value,
          $Res Function(NestedNestedx2Hello7Output) then) =
      _$NestedNestedx2Hello7OutputCopyWithImpl<$Res,
          NestedNestedx2Hello7Output>;
  @useResult
  $Res call({bool hello});
}

/// @nodoc
class _$NestedNestedx2Hello7OutputCopyWithImpl<$Res,
        $Val extends NestedNestedx2Hello7Output>
    implements $NestedNestedx2Hello7OutputCopyWith<$Res> {
  _$NestedNestedx2Hello7OutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NestedNestedx2Hello7Output
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
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NestedNestedx2Hello7OutputImplCopyWith<$Res>
    implements $NestedNestedx2Hello7OutputCopyWith<$Res> {
  factory _$$NestedNestedx2Hello7OutputImplCopyWith(
          _$NestedNestedx2Hello7OutputImpl value,
          $Res Function(_$NestedNestedx2Hello7OutputImpl) then) =
      __$$NestedNestedx2Hello7OutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hello});
}

/// @nodoc
class __$$NestedNestedx2Hello7OutputImplCopyWithImpl<$Res>
    extends _$NestedNestedx2Hello7OutputCopyWithImpl<$Res,
        _$NestedNestedx2Hello7OutputImpl>
    implements _$$NestedNestedx2Hello7OutputImplCopyWith<$Res> {
  __$$NestedNestedx2Hello7OutputImplCopyWithImpl(
      _$NestedNestedx2Hello7OutputImpl _value,
      $Res Function(_$NestedNestedx2Hello7OutputImpl) _then)
      : super(_value, _then);

  /// Create a copy of NestedNestedx2Hello7Output
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hello = null,
  }) {
    return _then(_$NestedNestedx2Hello7OutputImpl(
      hello: null == hello
          ? _value.hello
          : hello // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NestedNestedx2Hello7OutputImpl implements _NestedNestedx2Hello7Output {
  const _$NestedNestedx2Hello7OutputImpl({required this.hello});

  @override
  final bool hello;

  @override
  String toString() {
    return 'NestedNestedx2Hello7Output(hello: $hello)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NestedNestedx2Hello7OutputImpl &&
            (identical(other.hello, hello) || other.hello == hello));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hello);

  /// Create a copy of NestedNestedx2Hello7Output
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NestedNestedx2Hello7OutputImplCopyWith<_$NestedNestedx2Hello7OutputImpl>
      get copyWith => __$$NestedNestedx2Hello7OutputImplCopyWithImpl<
          _$NestedNestedx2Hello7OutputImpl>(this, _$identity);
}

abstract class _NestedNestedx2Hello7Output
    implements NestedNestedx2Hello7Output {
  const factory _NestedNestedx2Hello7Output({required final bool hello}) =
      _$NestedNestedx2Hello7OutputImpl;

  @override
  bool get hello;

  /// Create a copy of NestedNestedx2Hello7Output
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NestedNestedx2Hello7OutputImplCopyWith<_$NestedNestedx2Hello7OutputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
