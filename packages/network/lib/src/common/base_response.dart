final class BaseResponse<T> {
  final T? data;
  final int? statusCode;

  const BaseResponse({
    this.data,
    required this.statusCode,
  });
}
