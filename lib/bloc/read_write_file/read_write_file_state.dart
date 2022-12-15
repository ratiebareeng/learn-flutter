part of 'read_write_file_bloc.dart';

/// successful get documents directory
/// error get documents directory
/// success get reference to file
/// error get reference to file
/// success read, write to file
/// error read, write to file
abstract class ReadWriteFileState extends Equatable {
  const ReadWriteFileState();
}

class ReadWriteFileInitial extends ReadWriteFileState {
  @override
  List<Object> get props => [];
}

/// get reference to file in docs directory
class HomeSuccessfulGetDocsDirState extends ReadWriteFileState {
  final String path;

  const HomeSuccessfulGetDocsDirState({required this.path});
  @override
  List<Object?> get props => [path];
}

/// error
class ErrorGetDocsDirState extends ReadWriteFileState {
  final String errorMessage;

  const ErrorGetDocsDirState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// after you have successfully created a reference
/// to the file path in documents directory, takes dynamic file name
class SuccessCreateFileInDocsDirState extends ReadWriteFileState {
  final String fileName;

  const SuccessCreateFileInDocsDirState({required this.fileName});

  @override
  List<Object?> get props => [fileName];
}

/// if there's an error creating a reference to the file in doc dir
class ErrorCreateFileInDocsDirState extends ReadWriteFileState {
  final String errorMessage;

  const ErrorCreateFileInDocsDirState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// write data to file
class SuccessWriteDataToFile extends ReadWriteFileState {
  final String fileName;

  const SuccessWriteDataToFile({required this.fileName});
  @override
  List<Object?> get props => [fileName];
}

/// error writing to file
class ErrorWriteDataToFile extends ReadWriteFileState {
  final String errorMessage;

  const ErrorWriteDataToFile({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

/// success read from file
class SuccessReadFromFile extends ReadWriteFileState {
  final String contents;

  const SuccessReadFromFile({required this.contents});
  @override
  List<Object?> get props => [contents];
}

class ErrorReadFromFile extends ReadWriteFileState {
  final String errorMessage;
  //, errorName; required this.errorName

  const ErrorReadFromFile({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}
