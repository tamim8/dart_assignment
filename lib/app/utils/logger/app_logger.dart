import 'package:logger/logger.dart';

mixin class AppLogger {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() => _instance;

  final Logger _logger = Logger(printer: PrettyPrinter()); // Customize the printer

  AppLogger._internal();

  void log(LogLevel level, String message) {
    switch (level) {
      case LogLevel.info:
        _logger.i(message);
        break;
      case LogLevel.debug:
        _logger.d(message);
        break;
      case LogLevel.warning:
        _logger.w(message);
        break;
      case LogLevel.error:
        _logger.e(message);
        break;
      default:
        _logger.i(message);
        break;
    }
  }
}

enum LogLevel { info, debug, warning, error, verbose }
