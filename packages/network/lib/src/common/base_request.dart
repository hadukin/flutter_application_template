import 'package:dio/dio.dart';

abstract interface class BaseRequest {
  const BaseRequest();

  String get url;

  Map<String, dynamic>? get queryParameters;

  Map<String, dynamic>? get data;

  Map<String, String>? get headers;

  FormData? get formData;

  String get method;
}
