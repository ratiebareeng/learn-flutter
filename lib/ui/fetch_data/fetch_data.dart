import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc/home_bloc.dart';
import '../../bloc/home_bloc/home_event.dart';
import '../../bloc/home_bloc/home_state.dart';
import '../../model/food.dart';
import '../widgets/result_widget.dart';

class FetchDataWidget extends StatelessWidget {
  const FetchDataWidget({super.key});
  Widget _fetchDataButton(homeBloc) {
    return Center(
      child: ElevatedButton(
        child: const Text('Fetch Data'),
        onPressed: () {
          homeBloc.add(FetchDataEvent());
        },
      ),
    );
  }

  Widget _buildFoodCard(Food food) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Image.network(
                food.thumbnailUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Text(
                              food.price,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 0,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeBloC Fetch Data'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Load Data from API'),
          BlocConsumer<HomeBloc, HomeState>(
            /// called everytime state changes but does not return widget
            /// place side effects here ex show alerts, snackbars, hit trackers
            listener: (context, state) {},

            /// called everytime state changes
            builder: (context, state) {
              /// list all possible states and define their UI
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeSuccessFetchDataState) {
                return Center(
                  child: ListView.builder(
                    itemCount: state.foods.length,
                    itemBuilder: (context, index) =>
                        _buildFoodCard(state.foods[index]),
                  ),
                );
              }
              if (state is HomeErrorFetchDataState) {
                return ResultWidget(
                    textToDisplay: state.errorMessage,
                    sibling: _fetchDataButton(homeBloc));
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _fetchDataButton(homeBloc),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
