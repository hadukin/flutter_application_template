// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokes_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokensEntity {
  String get access => throw _privateConstructorUsedError;
  String get refresh => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokensEntityCopyWith<TokensEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensEntityCopyWith<$Res> {
  factory $TokensEntityCopyWith(
          TokensEntity value, $Res Function(TokensEntity) then) =
      _$TokensEntityCopyWithImpl<$Res, TokensEntity>;
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class _$TokensEntityCopyWithImpl<$Res, $Val extends TokensEntity>
    implements $TokensEntityCopyWith<$Res> {
  _$TokensEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokensEntityImplCopyWith<$Res>
    implements $TokensEntityCopyWith<$Res> {
  factory _$$TokensEntityImplCopyWith(
          _$TokensEntityImpl value, $Res Function(_$TokensEntityImpl) then) =
      __$$TokensEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class __$$TokensEntityImplCopyWithImpl<$Res>
    extends _$TokensEntityCopyWithImpl<$Res, _$TokensEntityImpl>
    implements _$$TokensEntityImplCopyWith<$Res> {
  __$$TokensEntityImplCopyWithImpl(
      _$TokensEntityImpl _value, $Res Function(_$TokensEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_$TokensEntityImpl(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TokensEntityImpl implements _TokensEntity {
  const _$TokensEntityImpl({required this.access, required this.refresh});

  @override
  final String access;
  @override
  final String refresh;

  @override
  String toString() {
    return 'TokensEntity(access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokensEntityImpl &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, access, refresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokensEntityImplCopyWith<_$TokensEntityImpl> get copyWith =>
      __$$TokensEntityImplCopyWithImpl<_$TokensEntityImpl>(this, _$identity);
}

abstract class _TokensEntity implements TokensEntity {
  const factory _TokensEntity(
      {required final String access,
      required final String refresh}) = _$TokensEntityImpl;

  @override
  String get access;
  @override
  String get refresh;
  @override
  @JsonKey(ignore: true)
  _$$TokensEntityImplCopyWith<_$TokensEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
