/*
 * Created by Kyle Fuehri
 */

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Service for handling logging throughout the app
/// Only logs in debug mode
class LoggerService {
  LoggerService._() {
    _logger = Logger(
      printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart),
      level: kDebugMode ? Level.debug : Level.off,
    );
  }
  static final LoggerService _instance = LoggerService._();
  static LoggerService get instance => _instance;

  late Logger _logger;

  /// Log a debug message
  void d(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log an info message
  void i(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a warning message
  void w(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log an error message
  void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a verbose message
  void v(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a wtf message (What a Terrible Failure)
  void wtf(String message, [dynamic error, StackTrace? stackTrace]) {
    // The logger package uses 'f' for fatal, which is equivalent to 'wtf'
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
