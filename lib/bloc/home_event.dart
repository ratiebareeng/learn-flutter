import 'dart:io';

import 'package:equatable/equatable.dart';

/// events or actions the page can perform
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

/// get documents directory
class GetDocumentsDirectoryEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

/// get reference to file in documents directory
class GetFileRefFromDocsDirEvent extends HomeEvent {
  final String fileName, fileExtension, documentsDirectory;

  const GetFileRefFromDocsDirEvent(
      {required this.documentsDirectory,
      required this.fileName,
      required this.fileExtension});
  @override
  List<Object?> get props => [fileName, fileExtension];
}

/// write to file
class WriteToFileEvent extends HomeEvent {
  final File file;
  final String stringToWrite;

  const WriteToFileEvent({required this.file, required this.stringToWrite});

  @override
  // TODO: implement props
  List<Object?> get props => [file, stringToWrite];
}

/// read from file
class ReadFromFileEvent extends HomeEvent {
  final File file;

  const ReadFromFileEvent({
    required this.file,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

/// reset
class ResetStateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
