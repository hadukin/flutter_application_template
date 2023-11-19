part of 'launch_view_model.dart';

@freezed
class LaunchState with _$LaunchState {
  factory LaunchState({
    required bool isLoading,
    UserEntity? user,
  }) = _LaunchState;

  factory LaunchState.initial() {
    return LaunchState(isLoading: false);
  }
}
