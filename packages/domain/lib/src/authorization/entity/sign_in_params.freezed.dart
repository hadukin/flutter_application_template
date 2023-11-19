// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInParams {
  String get email;
  String get password;

  /// Create a copy of SignInParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInParamsCopyWith<SignInParams> get copyWith =>
      _$SignInParamsCopyWithImpl<SignInParams>(
          this as SignInParams, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInParams(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $SignInParamsCopyWith<$Res> {
  factory $SignInParamsCopyWith(
          SignInParams value, $Res Function(SignInParams) _then) =
      _$SignInParamsCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInParamsCopyWithImpl<$Res> implements $SignInParamsCopyWith<$Res> {
  _$SignInParamsCopyWithImpl(this._self, this._then);

  final SignInParams _self;
  final $Res Function(SignInParams) _then;

  /// Create a copy of SignInParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SignInParams implements SignInParams {
  const _SignInParams({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  /// Create a copy of SignInParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInParamsCopyWith<_SignInParams> get copyWith =>
      __$SignInParamsCopyWithImpl<_SignInParams>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'SignInParams(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$SignInParamsCopyWith<$Res>
    implements $SignInParamsCopyWith<$Res> {
  factory _$SignInParamsCopyWith(
          _SignInParams value, $Res Function(_SignInParams) _then) =
      __$SignInParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInParamsCopyWithImpl<$Res>
    implements _$SignInParamsCopyWith<$Res> {
  __$SignInParamsCopyWithImpl(this._self, this._then);

  final _SignInParams _self;
  final $Res Function(_SignInParams) _then;

  /// Create a copy of SignInParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_SignInParams(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
