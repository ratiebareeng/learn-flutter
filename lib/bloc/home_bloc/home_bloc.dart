import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_flutter/FoodGenerator.dart';

import '../../model/food.dart';
import 'home_event.dart';
import 'home_state.dart';

/// provide initial state via super constructor
/// in this case it's an empty homeinitialstate
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// list all events that might be sent to our homebloc
  /// in this case we have only one event
  HomeBloc() : super(const HomeInitialState()) {
    /// When the HomeBloc receives a FetchDataEvent, it will try to handle the event
    /// by executing the handler given to it, in this case _onFetchDataEvent function.
    on<FetchDataEvent>(_onFetchDataEvent);

    /// reset data back to initial state
    on<ResetStateEvent>(_resetData);
  }

  void _resetData(
    ResetStateEvent event,
    Emitter<HomeState> emitter,
  ) {
    emitter(const HomeInitialState());
  }

  void _onFetchDataEvent(

      /// takes the type of event it handles
      FetchDataEvent event,

      /// an emitter which emits types of home states
      /// An Emitter is a class which is capable of emitting new states.
      /// See also: EventHandler which has access to an Emitter.
      Emitter<HomeState> emitter) async {
    /// change state to homeloadingstate
    emitter(const HomeLoadingState());

    /// delay function by 2 secs, simulating network call
    await Future.delayed(const Duration(seconds: 2));

    /// generate random bool
    bool isSucceed = Random().nextBool();

    /// condition
    if (isSucceed) {
      /// create a list of foods
      List<Food> sampleFoods = FoodGenerator.generateDummyFoods();

      /// emit new state homesuccessfetchdata passing food list
      emitter(HomeSuccessFetchDataState(foods: sampleFoods));
    } else {
      /// emit new state homeerrorfetchdatastate
      emitter(const HomeErrorFetchDataState(
          errorMessage: "something went wrong..."));
    }
  }

  /* @override
  Stream<HomeState> get mapEventToState(HomeEvent event) {
    if(event is GetDocumentsDirectoryEvent) {}
  }*/
}
