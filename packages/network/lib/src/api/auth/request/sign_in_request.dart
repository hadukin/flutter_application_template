import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/common/base_request.dart';
import 'package:network/src/common/request_method.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
final class SignInRequest implements BaseRequest {
  final String email;
  final String password;

  const SignInRequest({
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic>? get data => _$SignInRequestToJson(this);

  @override
  FormData? get formData => null;

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  String get url => '/login';

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  Map<String, String>? get headers => null;
}
