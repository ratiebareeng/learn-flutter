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
  final File file;
  final String stringToWrite;

  const WriteToFileEvent({required this.file, required this.stringToWrite});

  @override
  List<Object?> get props => [file, stringToWrite];
}

/// read from file
class ReadFromFileEvent extends ReadWriteFileEvent {
  final File file;

  const ReadFromFileEvent({
    required this.file,
  });

  @override
  List<Object?> get props => [file];
}
