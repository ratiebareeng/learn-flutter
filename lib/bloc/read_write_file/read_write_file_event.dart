part of 'read_write_file_bloc.dart';

/// get document directory path
/// get reference to document in directory
/// write to to file
/// read from file
abstract class ReadWriteFileEvent extends Equatable {
  const ReadWriteFileEvent();
}

/// get documents directory
class GetDocumentsDirectoryEvent extends ReadWriteFileEvent {
  @override
  List<Object?> get props => [];
}

/// get reference to file in documents directory
class GetFileRefFromDocsDirEvent extends ReadWriteFileEvent {
  final String fileName, fileExtension, documentsDirectory;

  const GetFileRefFromDocsDirEvent(
      {required this.documentsDirectory,
      required this.fileName,
      required this.fileExtension});
  @override
  List<Object?> get props => [fileName, fileExtension];
}

/// write to file
class WriteToFileEvent extends ReadWriteFileEvent {
  final String fileName;
  final String stringToWrite;

  const WriteToFileEvent({required this.fileName, required this.stringToWrite});

  @override
  List<Object?> get props => [fileName, stringToWrite];
}

/// read from file
class ReadFromFileEvent extends ReadWriteFileEvent {
  final String fileName;

  const ReadFromFileEvent({
    required this.fileName,
  });

  @override
  List<Object?> get props => [fileName];
}

class ResetDataEvent extends ReadWriteFileEvent {
  @override
  List<Object?> get props => [];
}
