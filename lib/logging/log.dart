import 'dart:core';
import 'dart:developer';

import 'package:test_bloc_flutter/logging/file_printer.dart';

import 'log_level.dart';

class LogEvent {
  final LogLevel level;
  final String message; // dynamic
  final String? className;
  final String? methodName;
  final Object? exception; // dynamic
  final StackTrace? stackTrace;
  final bool? overrideExisting;

  LogEvent({
    required this.level,
    required this.message,
    this.className,
    this.methodName,
    this.exception,
    this.stackTrace,
    this.overrideExisting,
  });
}

class Log {
  static LogLevel level = LogLevel.verbose;

  static late FilePrinter _filePrinter;

  /// Private constructor
  Log._create();

  /// initialize FilePrinter; get reference to log file
  static Future<Log> init({String? fileName, LogLevel? logLevel}) async {
    if (logLevel != null) {
      level = logLevel;
    }
    var log = Log._create();
    _filePrinter = await FilePrinter.init(fileName);
    return log;
  }

  static Future<void> i(
    String message, {
    String? className,
    String? methodName,
    Object? exception,
    StackTrace? stacktrace,
    bool overrideExisting = false,
  }) async {
    return _filePrinter.logToFile(
      event: LogEvent(
        overrideExisting: overrideExisting,
        level: LogLevel.info,
        message: message,
        className: className,
        methodName: methodName,
        exception: exception,
        stackTrace: stacktrace,
      ),
    );
  }

  static Future<void> d(
    String message, {
    String? className,
    String? methodName,
    Object? exception,
    StackTrace? stacktrace,
    bool overrideExisting = false,
  }) async {
    log('$message ${DateTime.now().toString()}');
    return _filePrinter.logToFile(
      event: LogEvent(
        overrideExisting: overrideExisting,
        level: LogLevel.debug,
        message: message,
        className: className,
        methodName: methodName,
        exception: exception,
        stackTrace: stacktrace,
      ),
    );
  }

  static Future<void> e(
    String message, {
    String? className,
    String? methodName,
    Object? exception,
    StackTrace? stacktrace,
    bool overrideExisting = false,
  }) async {
    return _filePrinter.logToFile(
      event: LogEvent(
        overrideExisting: overrideExisting,
        level: LogLevel.error,
        message: message,
        className: className,
        methodName: methodName,
        exception: exception,
        stackTrace: stacktrace,
      ),
    );
  }

  static Future<void> v(
    String message, {
    String? className,
    String? methodName,
    Object? exception,
    StackTrace? stacktrace,
    bool overrideExisting = false,
  }) async {
    return _filePrinter.logToFile(
      event: LogEvent(
        overrideExisting: overrideExisting,
        level: LogLevel.verbose,
        message: message,
        className: className,
        methodName: methodName,
        exception: exception,
        stackTrace: stacktrace,
      ),
    );
  }

  static Future w(
    String message, {
    String? className,
    String? methodName,
    Object? exception,
    StackTrace? stacktrace,
    bool overrideExisting = false,
  }) async {
    return _filePrinter.logToFile(
      event: LogEvent(
        overrideExisting: overrideExisting,
        level: LogLevel.warn,
        message: message,
        className: className,
        methodName: methodName,
        exception: exception,
        stackTrace: stacktrace,
      ),
    );
  }

  static Future f(
    String message, {
    String? className,
    String? methodName,
    Object? exception,
    StackTrace? stacktrace,
    bool overrideExisting = false,
  }) async {
    return _filePrinter.logToFile(
      event: LogEvent(
        overrideExisting: overrideExisting,
        level: LogLevel.fatal,
        message: message,
        className: className,
        methodName: methodName,
        exception: exception,
        stackTrace: stacktrace,
      ),
    );
  }
}
