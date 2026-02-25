import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/common/base_request.dart';
import 'package:network/src/client/dio_client/impl/base_dio_client_provider.dart';
import 'package:network/src/common/base_response.dart';

final class DioClientProviderImpl extends BaseDioClientProvider {
  final Dio _dio;
  final TokenStore _tokenStore;

  DioClientProviderImpl({
    required Dio dio,
    required TokenStore tokenStore,
  })  : _dio = dio,
        _tokenStore = tokenStore;

  @override
  Future<BaseResponse> request(BaseRequest request) async {
    try {
      final response = await _dio.request(
        request.url,
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          method: request.method.name,
          headers: buildHeaders(
            accessToken: _tokenStore.value?.access,
            headers: request.headers,
          ),
        ),
      );
      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
