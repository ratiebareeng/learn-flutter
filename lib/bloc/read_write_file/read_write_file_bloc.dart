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
  }

  /// get documents directory
  void _getDocumentsDirectory(
    GetDocumentsDirectoryEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    try {
      emitter(ReadWriteFileInitial());
      final Directory directory = await getApplicationDocumentsDirectory();

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
    final path = event.documentsDirectory;
    emitter(SuccessCreateFileInDocsDirState(
        file: File('$path/${event.fileName}.${event.fileExtension}')));
  }

  /// write data to file
  void _writeToFile(
    WriteToFileEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    // read file
    await event.file
        .writeAsString(event.stringToWrite, mode: FileMode.append)
        .catchError((error) {
      emitter(ErrorWriteDataToFile(errorMessage: error.toString()));
    });
    emitter(SuccessWriteDataToFile(file: event.file));
  }

  /// read data from file
  void _readFromFile(
    ReadFromFileEvent event,
    Emitter<ReadWriteFileState> emitter,
  ) async {
    // read file
    String contents = await event.file.readAsString().catchError((error) {
      emitter(ErrorReadFromFile(errorMessage: error.toString()));
    });
    emitter(SuccessReadFromFile(contents: contents));
  }
}
