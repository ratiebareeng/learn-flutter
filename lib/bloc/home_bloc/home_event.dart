import 'package:equatable/equatable.dart';

/// events or actions the page can perform
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

/// reset
class ResetStateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
