part of 'launch_view_model.dart';

@freezed
abstract class LaunchState with _$LaunchState {
  const factory LaunchState({
    @Default(false) bool isLoading,
    UserEntity? user,
  }) = _LaunchState;
}
