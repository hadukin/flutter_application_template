import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_params.freezed.dart';

@freezed
class SignUpParams with _$SignUpParams {
  factory SignUpParams({
    required String email,
    required String password,
  }) = _SignUpParams;
}
