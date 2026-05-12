import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 80,
      colors: true,
      printEmojis: true,
    ),
    level: Level.debug, // change to Level.warning in production
  );

  static void debug(dynamic message)   => _logger.d(message);
  static void info(dynamic message)    => _logger.i(message);
  static void warning(dynamic message) => _logger.w(message);
  static void error(dynamic message, [dynamic error, StackTrace? st]) =>
      _logger.e(message, error: error, stackTrace: st);
}
