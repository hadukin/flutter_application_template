import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_params.freezed.dart';

@freezed
class SignInParams with _$SignInParams {
  factory SignInParams({
    required String email,
    required String password,
  }) = _SignInParams;
}
