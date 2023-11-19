import 'package:network/src/client/rest_client/rest_client_provider.dart';

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
}
