final class BaseResponse<T> {
  final T? data;
  final int? statusCode;

  BaseResponse({
    this.data,
    required this.statusCode,
  });
}
