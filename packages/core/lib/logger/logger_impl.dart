import 'package:logger/logger.dart';

final class Log {
  static final Log _instance = Log._();

  Log._();

  static Log get i => _instance;

  final _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  void debug(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _logger.d('${tag ?? ''}$message', error: error, stackTrace: stackTrace);
  }

  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void info(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }
}
