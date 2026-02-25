abstract interface class NetworkConfig {
  const NetworkConfig();

  static const authHeader = 'Authorization';
  static const bearerPrefix = 'Bearer';

  static String baseUrl =
      const String.fromEnvironment('BASE_URL', defaultValue: 'https://flutter-template.wiremockapi.cloud');

  static Map<String, String> buildAuthorizationHeader(String? token) {
    if (token != null) return {authHeader: '${NetworkConfig.bearerPrefix} $token'};
    return {};
  }
}
