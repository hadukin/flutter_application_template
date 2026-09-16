import 'package:talker_flutter/talker_flutter.dart';

abstract final class Log {
  static final Log _instance = LogImpl();

  Log._();

  static Log get i => _instance;

  void debug(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  });
  void error(String message, {Object? error, StackTrace? stackTrace});

  void info(String message, {Object? error, StackTrace? stackTrace});

  void warning(String message, {Object? error, StackTrace? stackTrace});
}

final class LogImpl implements Log {
  final _talker = Talker();

  // static final Log _instance = LogImpl._();

  // LogImpl._();

  // static Log get i => _instance;

  // final _logger = Logger(
  //   printer: PrettyPrinter(
  //     colors: true,
  //     printEmojis: true,
  //     dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  //   ),
  //   level: Level.debug,
  // );

  @override
  void debug(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _talker.debug(message, error, stackTrace);
    // _logger.d('${tag ?? ''}$message', error: error, stackTrace: stackTrace);
  }

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _talker.error(message, error, stackTrace);
    // _logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message, {Object? error, StackTrace? stackTrace}) {
    _talker.info(message, error, stackTrace);
    // _logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    _talker.warning(message, error, stackTrace);
    // _logger.w(message, error: error, stackTrace: stackTrace);
  }
}
