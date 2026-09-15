// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LaunchState {

 bool get isLoading; UserEntity? get user;
/// Create a copy of LaunchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchStateCopyWith<LaunchState> get copyWith => _$LaunchStateCopyWithImpl<LaunchState>(this as LaunchState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LaunchState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchState&&(identical(other.isLoading, _this.isLoading) || other.isLoading == _this.isLoading)&&(identical(other.user, _this.user) || other.user == _this.user));
}


@override
int get hashCode {
  final _this = this as LaunchState;
  return Object.hash(runtimeType,_this.isLoading,_this.user);
}

@override
String toString() {
  final _this = this as LaunchState;
  return 'LaunchState(isLoading: ${_this.isLoading}, user: ${_this.user})';
}


}

/// @nodoc
abstract mixin class $LaunchStateCopyWith<$Res>  {
  factory $LaunchStateCopyWith(LaunchState value, $Res Function(LaunchState) _then) = _$LaunchStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, UserEntity? user
});


$UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class _$LaunchStateCopyWithImpl<$Res>
    implements $LaunchStateCopyWith<$Res> {
  _$LaunchStateCopyWithImpl(this._self, this._then);

  final LaunchState _self;
  final $Res Function(LaunchState) _then;

/// Create a copy of LaunchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? user = freezed,}) {
  return _then(LaunchState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [LaunchState].
extension LaunchStatePatterns on LaunchState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchState value)  $default,){
final _that = this;
switch (_that) {
case _LaunchState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchState value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  UserEntity? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchState() when $default != null:
return $default(_that.isLoading,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  UserEntity? user)  $default,) {final _that = this;
switch (_that) {
case _LaunchState():
return $default(_that.isLoading,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  UserEntity? user)?  $default,) {final _that = this;
switch (_that) {
case _LaunchState() when $default != null:
return $default(_that.isLoading,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _LaunchState implements LaunchState {
  const _LaunchState({this.isLoading = false, this.user});
  

@override@JsonKey() final  bool isLoading;
@override final  UserEntity? user;

/// Create a copy of LaunchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchStateCopyWith<_LaunchState> get copyWith => __$LaunchStateCopyWithImpl<_LaunchState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isLoading,user);
}

@override
String toString() {
    return 'LaunchState(isLoading: $isLoading, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LaunchStateCopyWith<$Res> implements $LaunchStateCopyWith<$Res> {
  factory _$LaunchStateCopyWith(_LaunchState value, $Res Function(_LaunchState) _then) = __$LaunchStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, UserEntity? user
});


@override $UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class __$LaunchStateCopyWithImpl<$Res>
    implements _$LaunchStateCopyWith<$Res> {
  __$LaunchStateCopyWithImpl(this._self, this._then);

  final _LaunchState _self;
  final $Res Function(_LaunchState) _then;

/// Create a copy of LaunchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? user = freezed,}) {
  return _then(_LaunchState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
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
