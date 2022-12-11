import 'package:logging/logging.dart';

void setUpLog() {
  /// create a logger instatnce
  Logger.root.level = Level.ALL;

  /// listener called every time log is recorded
  Logger.root.onRecord.listen(((record) {
    /// printing log level, time and message
    print('${record.level.name}: ${record.time}: ${record.message}');
  }));
}
