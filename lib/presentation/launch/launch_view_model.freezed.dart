// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaunchState {
  bool get isLoading;
  UserEntity? get user;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaunchStateCopyWith<LaunchState> get copyWith =>
      _$LaunchStateCopyWithImpl<LaunchState>(this as LaunchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaunchState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, user);

  @override
  String toString() {
    return 'LaunchState(isLoading: $isLoading, user: $user)';
  }
}

/// @nodoc
abstract mixin class $LaunchStateCopyWith<$Res> {
  factory $LaunchStateCopyWith(
          LaunchState value, $Res Function(LaunchState) _then) =
      _$LaunchStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, UserEntity? user});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$LaunchStateCopyWithImpl<$Res> implements $LaunchStateCopyWith<$Res> {
  _$LaunchStateCopyWithImpl(this._self, this._then);

  final LaunchState _self;
  final $Res Function(LaunchState) _then;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _LaunchState implements LaunchState {
  const _LaunchState({this.isLoading = false, this.user});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final UserEntity? user;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LaunchStateCopyWith<_LaunchState> get copyWith =>
      __$LaunchStateCopyWithImpl<_LaunchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LaunchState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, user);

  @override
  String toString() {
    return 'LaunchState(isLoading: $isLoading, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$LaunchStateCopyWith<$Res>
    implements $LaunchStateCopyWith<$Res> {
  factory _$LaunchStateCopyWith(
          _LaunchState value, $Res Function(_LaunchState) _then) =
      __$LaunchStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, UserEntity? user});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$LaunchStateCopyWithImpl<$Res> implements _$LaunchStateCopyWith<$Res> {
  __$LaunchStateCopyWithImpl(this._self, this._then);

  final _LaunchState _self;
  final $Res Function(_LaunchState) _then;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
  }) {
    return _then(_LaunchState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
