import 'package:flutter/foundation.dart';

final class AppEnv {
  static final AppEnv _instance = AppEnv._();

  AppEnv._();

  static AppEnv get instance => _instance;

  bool isDebug = kDebugMode;
  bool isRelease = kReleaseMode;

  String baseUrl = const String.fromEnvironment('BASE_URL', defaultValue: 'https://run.mocky.io');
}
