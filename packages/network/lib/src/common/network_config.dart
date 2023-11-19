abstract interface class NetworkConfig {
  const NetworkConfig();

  static const authHeader = 'Authorization';
  static const bearerPrefix = 'Bearer';

  static String baseUrl =
      const String.fromEnvironment('BASE_URL', defaultValue: 'https://flutter-template.wiremockapi.cloud');
}
