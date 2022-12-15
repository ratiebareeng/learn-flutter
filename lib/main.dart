// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_manager/controller/settings_controller.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_bloc.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_event.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_state.dart';
import 'package:test_bloc_flutter/show_side.dart';
import 'package:tft_theme/tft_theme.dart';
import 'package:tft_widgets/tft_application/tft_application_widget.dart';

import 'bloc/read_write_file/read_write_file_bloc.dart';
import 'logging/log.dart';
import 'logging/log_settings.dart';
import 'model/food.dart';

void main() async {
  setUpLog(logFileName: 'tft_log');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ReadWriteFileBloc()),
      ],
      child: const HomeSreen(),
    ),
  );
}

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  late HomeBloc homeBloc;
  late ReadWriteFileBloc readWriteFileBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    readWriteFileBloc = context.read<ReadWriteFileBloc>();
  }

  Widget _fetchDataButton() {
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

  Widget _mainComponent() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc App"),
          actions: [
            IconButton(
                onPressed: () {
                  homeBloc.add(ResetStateEvent());
                  readWriteFileBloc.add(ResetDataEvent());
                },
                icon: const Icon(Icons.refresh)),
          ],
        ),
        body: Column(
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
                  return _resultWidget(
                      textToDisplay: state.errorMessage,
                      sibling: _fetchDataButton());
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _fetchDataButton(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShowSide()));
                      },
                      child: const Text('SideMenu'),
                    ),
                  ],
                );
              },
            ),
            const Text('Read Write File'),
            BlocConsumer<ReadWriteFileBloc, ReadWriteFileState>(
              builder: (context, state) {
                /* if (state is ReadWriteFileInitial) {
                  return const Center(child: CircularProgressIndicator());
                }*/
                if (state is ErrorGetDocsDirState) {
                  return _resultWidget(
                      textToDisplay: state.errorMessage,
                      sibling: _getDocsDirButton());
                }

                if (state is HomeSuccessfulGetDocsDirState) {
                  return _resultWidget(
                      textToDisplay: state.path,
                      sibling: _getFileRefButton(state.path));
                }

                if (state is SuccessCreateFileInDocsDirState) {
                  return _resultWidget(
                      textToDisplay: state.fileName,
                      sibling: _writeToFile(fileName: 'tuesday.txt'));
                }

                if (state is SuccessWriteDataToFile) {
                  return _resultWidget(
                      textToDisplay: 'File Updated',
                      sibling: _readFromFile(fileName: 'my_counter.txt'));
                }

                if (state is SuccessReadFromFile) {
                  return _resultWidget(
                    textToDisplay: state.contents,
                  );
                }

                if (state is ErrorCreateFileInDocsDirState) {
                  return _resultWidget(textToDisplay: state.errorMessage);
                }

                if (state is ErrorReadFromFile) {
                  return _resultWidget(textToDisplay: state.errorMessage);
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _getDocsDirButton(),
                    _readFromFile(fileName: 'my_counter.txt'),
                    TextButton(
                        onPressed: () async {
                          /*    await Log.i(
                            'New Logging!',
                            className: 'main.dart',
                            methodName: 'onPressed Write Log To File',
                          );
                          await Log.d(
                            '14 December!',
                          );
                          await Log.e('Week 3!',
                              overrideExisting: false,
                              className: 'HomeSreen',
                              methodName: 'onPressed',
                              exception: const FormatException());
                          await Log.w('Speak up!', false);
                          await Log.v('This is a log message!'); */
                          await Log.v('Verbose');
                          await Log.i('Info');
                          await Log.d('Debug');
                          await Log.e('Error');
                          await Log.w('Warn');
                          await Log.f('Fatal');
                        },
                        child: const Text('Write Log To File'))
                  ],
                );
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
    );
  }

  /// success widget
  Widget _resultWidget({required String textToDisplay, Widget? sibling}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(textToDisplay),
          sibling ?? Container(),
        ],
      ),
    );
  }

  Widget _getDocsDirButton() {
    return kIsWeb
        ? Container()
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(GetDocumentsDirectoryEvent());
            },
            child: const Text('Get Document Directory'),
          );
  }

  Widget _getFileRefButton(String docsPath) {
    return kIsWeb
        ? Container()
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(GetFileRefFromDocsDirEvent(
                  documentsDirectory: docsPath,
                  fileName: 'my_counter',
                  fileExtension: 'txt'));
            },
            child: const Text('Get File Reference'),
          );
  }

  Widget _writeToFile({required String fileName}) {
    return TextButton(
      onPressed: () async {
        Log.i('writing to file');
        readWriteFileBloc.add(WriteToFileEvent(
            fileName: fileName,
            stringToWrite: DateTime.now().toIso8601String()));
      },
      child: Text('Write to File: $fileName'),
    );
  }

  Widget _readFromFile({required String fileName}) {
    return kIsWeb
        ? const Text('Web Not Available')
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(ReadFromFileEvent(fileName: fileName));
            },
            child: Text('Read from File: $fileName'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return TFTApplication(
      onLoadApp: () {
        SettingsController.instance.loadSettings();
      },
      systemTheme: ThemeMode.light,
      appTheme: ThemeData(useMaterial3: false, colorScheme: lightColorScheme),
      appDarkTheme:
          ThemeData(useMaterial3: false, colorScheme: darkColorScheme),
      appTitle: 'Test Bloc Flutter',
      routes: [
        RouteDataDTO(
          component: _mainComponent(),
          routeName: '/',
        ),
      ],
    );
  }
}
