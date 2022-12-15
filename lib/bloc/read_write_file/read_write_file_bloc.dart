import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'read_write_file_event.dart';
part 'read_write_file_state.dart';

class ReadWriteFileBloc extends Bloc<ReadWriteFileEvent, ReadWriteFileState> {
  ReadWriteFileBloc() : super(ReadWriteFileInitial()) {
    on<GetDocumentsDirectoryEvent>(_getDocumentsDirectory);
    on<GetFileRefFromDocsDirEvent>(_getFileRefFromDocsDir);
    on<WriteToFileEvent>(_writeToFile);
    on<ReadFromFileEvent>(_readFromFile);
    on<ResetDataEvent>(_reset);
  }

  void _reset(
    ResetDataEvent event,
    Emitter emitter,
  ) {
    emitter(ReadWriteFileInitial());
  }

  /// get documents directory
  void _getDocumentsDirectory(
    GetDocumentsDirectoryEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    try {
      emitter(ReadWriteFileInitial());
      final Directory directory = await getDocumentsDirectory();

      emitter(HomeSuccessfulGetDocsDirState(path: directory.path));
    } on MissingPlatformDirectoryException catch (e) {
      emitter(ErrorGetDocsDirState(errorMessage: e.message));
    }
  }

  /// get reference to file in docs directory
  void _getFileRefFromDocsDir(
    GetFileRefFromDocsDirEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    emitter(SuccessCreateFileInDocsDirState(
        fileName: '${event.fileName}.${event.fileExtension}'));
  }

  /// write data to file
  void _writeToFile(
    WriteToFileEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    final Directory directory = await getDocumentsDirectory();
    final File fileToWrite = File('${directory.path}/${event.fileName}');
    // read file
    try {
      await fileToWrite.writeAsString(event.stringToWrite,
          mode: FileMode.append);
      emitter(SuccessWriteDataToFile(fileName: event.fileName));
      log('_writeToFile: ${event.stringToWrite}');
    } catch (e) {
      log('_writeToFile: ${e.toString()}');
      emitter(ErrorWriteDataToFile(errorMessage: e.toString()));
    }
  }

  /// read data from file
  void _readFromFile(
    ReadFromFileEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    // read file
    /// 1. get documents dir,
    emitter(ReadWriteFileInitial());
    final Directory directory = await getDocumentsDirectory();
    log(directory.path);
    String filePath = '${directory.path}/${event.fileName}';

    if (Platform.isWindows) {
      filePath = filePath.replaceAll('/', '\\');
    }

    ///  2. get reference to file
    try {
      String contents = await File(filePath).readAsString();
      emitter(SuccessReadFromFile(contents: contents));
      log('contents: $contents');
    } on FileSystemException catch (e) {
      log('_readFromFile: ${e.toString()}');
      emitter(ErrorReadFromFile(errorMessage: e.message));
    }
  }
}

Future<Directory> getDocumentsDirectory() async =>
    await getApplicationDocumentsDirectory();
