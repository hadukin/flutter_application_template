// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LaunchState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchStateCopyWith<LaunchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchStateCopyWith<$Res> {
  factory $LaunchStateCopyWith(
          LaunchState value, $Res Function(LaunchState) then) =
      _$LaunchStateCopyWithImpl<$Res, LaunchState>;
  @useResult
  $Res call({bool isLoading, UserEntity? user});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$LaunchStateCopyWithImpl<$Res, $Val extends LaunchState>
    implements $LaunchStateCopyWith<$Res> {
  _$LaunchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ) as $Val);
  }

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchStateImplCopyWith<$Res>
    implements $LaunchStateCopyWith<$Res> {
  factory _$$LaunchStateImplCopyWith(
          _$LaunchStateImpl value, $Res Function(_$LaunchStateImpl) then) =
      __$$LaunchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, UserEntity? user});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LaunchStateImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$LaunchStateImpl>
    implements _$$LaunchStateImplCopyWith<$Res> {
  __$$LaunchStateImplCopyWithImpl(
      _$LaunchStateImpl _value, $Res Function(_$LaunchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
  }) {
    return _then(_$LaunchStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc

class _$LaunchStateImpl implements _LaunchState {
  _$LaunchStateImpl({required this.isLoading, this.user});

  @override
  final bool isLoading;
  @override
  final UserEntity? user;

  @override
  String toString() {
    return 'LaunchState(isLoading: $isLoading, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, user);

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchStateImplCopyWith<_$LaunchStateImpl> get copyWith =>
      __$$LaunchStateImplCopyWithImpl<_$LaunchStateImpl>(this, _$identity);
}

abstract class _LaunchState implements LaunchState {
  factory _LaunchState(
      {required final bool isLoading,
      final UserEntity? user}) = _$LaunchStateImpl;

  @override
  bool get isLoading;
  @override
  UserEntity? get user;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchStateImplCopyWith<_$LaunchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
