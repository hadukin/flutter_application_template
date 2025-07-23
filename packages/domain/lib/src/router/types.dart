typedef QueryArgs = Map<String, dynamic>;
typedef PathArgs = Map<String, String>;

mixin RouterQueryBuilderMixin {
  String buildPath(String path, {QueryArgs? queryParams}) {
    List<String> paramList = [];

    Uri uri = Uri.parse(path);
    if (uri.queryParameters.isNotEmpty) {
      queryParams = {...uri.queryParameters, ...?queryParams};
    }

    queryParams?.forEach((key, value) {
      String encodedKey = Uri.encodeComponent(key);
      String encodedValue = Uri.encodeComponent('$value');
      paramList.add('$encodedKey=$encodedValue');
    });

    String queryString = paramList.join('&');
    String result = path;

    if (queryString.isNotEmpty) {
      result += (path.contains('?') ? '&' : '?') + queryString;
    }

    return result;
  }
}

