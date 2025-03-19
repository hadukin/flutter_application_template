import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/common/base_request.dart';

part '{{name.snakeCase()}}_request.g.dart';

@JsonSerializable()
final class {{name.pascalCase()}}Request implements BaseRequest {
  const {{name.pascalCase()}}Request();

  @override
  Map<String, dynamic>? get data => _${{name.pascalCase()}}RequestToJson(this);

  @override
  FormData? get formData => null;

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  String get url => '';

  @override
  String get method => '';

  @override
  Map<String, String>? get headers => null;
}
