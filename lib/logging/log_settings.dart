import 'package:test_bloc_flutter/logging/log_level.dart';

import 'log.dart';

void setUpLog({String? logFileName}) async {
  await Log.init(fileName: logFileName, logLevel: LogLevel.error);
}
