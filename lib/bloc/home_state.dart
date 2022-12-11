import 'dart:io';

import 'package:equatable/equatable.dart';

import '../model/food.dart';

/// app can only have one state at a time
/// below we define the different states our app can have
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// state when waiting for API response
/// show progress/loading indicator to alert user
class HomeLoadingState extends HomeState {
  const HomeLoadingState();
  @override
  List<Object?> get props => [];
}

/// after you have successfully created a reference
/// to the file path in documents directory
class SuccessCreateFileInDocsDirState extends HomeState {
  final File file;

  const SuccessCreateFileInDocsDirState({required this.file});

  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

/// if there's an error creating a reference to the file in doc dir
class ErrorCreateFileInDocsDirState extends HomeState {
  final String errorMessage;

  const ErrorCreateFileInDocsDirState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// get reference to file in docs directory
class HomeSuccessfulGetDocsDirState extends HomeState {
  final String path;

  const HomeSuccessfulGetDocsDirState({required this.path});
  @override
  List<Object?> get props => [path];
}

class ErrorGetDocsDirState extends HomeState {
  final String errorMessage;

  const ErrorGetDocsDirState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// get an error response from API
/// alert user with error message and display appropriate actions
class HomeErrorFetchDataState extends HomeState {
  final String errorMessage;
  const HomeErrorFetchDataState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

/// successfully get data from API
/// go on to display it
class HomeSuccessFetchDataState extends HomeState {
  final List<Food> foods;
  const HomeSuccessFetchDataState({required this.foods});

  @override
  List<Object?> get props => [foods];
}

/// write data to file
class SuccessWriteDataToFile extends HomeState {
  final File file;

  const SuccessWriteDataToFile({required this.file});
  @override
  List<Object?> get props => [file];
}

class SuccessReadFromFile extends HomeState {
  final String contents;

  const SuccessReadFromFile({required this.contents});
  @override
  List<Object?> get props => [contents];
}

/// error writing to file
class ErrorWriteDataToFile extends HomeState {
  final String errorMessage;
  //, errorName; required this.errorName

  const ErrorWriteDataToFile({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

class ErrorReadFromFile extends HomeState {
  final String errorMessage;
  //, errorName; required this.errorName

  const ErrorReadFromFile({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

/// successful read from file
/*class SuccessReadFromFile extends HomeState {
  final File file;

  const SuccessReadFromFile({required this.file});

  @override
  List<Object?> get props => [file];
}*/
