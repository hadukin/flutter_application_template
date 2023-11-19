import 'package:dio/dio.dart';
import 'package:network/entity/request_data.dart';
import 'package:network/interface/rest_client_provider.dart';
import 'package:path/path.dart' as p;

abstract base class BaseRestClientProvider implements RestClientProvider {
  final Uri baseUri;

  BaseRestClientProvider({required String baseUrl}) : baseUri = Uri.parse(baseUrl);

  Uri buildUri({required String path, Map<String, Object?>? queryParams}) {
    final finalPath = p.canonicalize(p.join(baseUri.path, path));
    return baseUri.replace(
      path: finalPath,
      queryParameters: {
        ...baseUri.queryParameters,
        if (queryParams != null) ...queryParams,
      },
    );
  }

  Future<Object?> buildData(Object? body) async {
    if (body is MultipartFormData) {
      final Map<String, Object?> formData = {};

      body.data?.forEach((key, value) async {
        if (value is MultipartDataFile) {
          final multipartValue = switch (value) {
            MultipartFileFromFile(:final filePath) => await MultipartFile.fromFile(filePath),
            MultipartFileFromBytes(:final bytes) => MultipartFile.fromBytes(bytes),
          };
          formData.putIfAbsent(key, () => multipartValue);
        } else {
          formData.putIfAbsent(key, () => value);
        }
      });

      return FormData.fromMap(formData);
    }

    return body;
  }
}
