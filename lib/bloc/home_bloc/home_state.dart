import 'package:equatable/equatable.dart';

import '../../model/food.dart';

/// app can only have one state at a time
/// below we define the different states our app can have
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object?> get props => [];
}

/// state when waiting for API response
/// show progress/loading indicator to alert user
class HomeLoadingState extends HomeState {
  const HomeLoadingState();
  @override
  List<Object?> get props => [];
}

/// get an error response from API
/// alert user with error message and display appropriate actions
class HomeErrorFetchDataState extends HomeState {
  final String errorMessage;
  const HomeErrorFetchDataState({required this.errorMessage});

  @override
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
