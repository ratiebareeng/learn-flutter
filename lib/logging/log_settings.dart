import 'package:flutter/foundation.dart';
import 'package:test_bloc_flutter/logging/log_level.dart';

import 'log.dart';

void setUpLog({String? logFileName}) async {
  await Log.init(fileName: logFileName, logLevel: LogLevel.debug);
}

bool isDebugMode = true;
void sendErrorReportToBackend(isDebug) {
  // capture reported errors
  // Error class used to report Flutter-specific assertion failures and contract violations.
  FlutterError.onError = (details) async {
    // grab error details as sent through when calling FlutterError.report()
    final dynamic exception = details.exception;
    final StackTrace? stackTrace = details.stack;

    // can decide what to do in debug and release
    if (isDebug) {
      // Log class writes logs to file
      Log.d('We are loggin in debug mode to a file',
          exception: exception, stacktrace: stackTrace);
    } else {
      // force flutter to output to console even in release
      // Zone.current.handleUncaughtError(exception, stackTrace!);

      // Send request to server backend, passing details
      Log.d('We are loggin in debug mode to a file',
          exception: exception, stacktrace: stackTrace);
      // await sendErrorToServer(details.toString());
    }
  };
}
