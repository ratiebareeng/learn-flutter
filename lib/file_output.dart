/* import 'dart:io';

import 'package:logging/logging.dart';

class FileOutput extends LogOutput {
  final String path;
  FileOutput(this.path);

  late File? file;

  @override
  void init() {
    // super.init();
    file = File(path);
  }

  @override
  void output(OutputEvent event) async {
    if (file != null) {
      for (var line in event.lines) {
        await file!.writeAsString("${line.toString()}\n",
            mode: FileMode.writeOnlyAppend);
      }
    } else {
      for (var line in event.lines) {
        print(line);
      }
    }
  }
}
 */