import 'dart:io';
import 'dart:ui';

import 'package:bloc_manager/blocs/blocs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:settings_manager/controller/settings_controller.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_bloc.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_event.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_state.dart';
import 'package:test_bloc_flutter/log_settings.dart';
import 'package:test_bloc_flutter/show_side.dart';
import 'package:tft_theme/tft_theme.dart';
import 'package:tft_widgets/tft_application/tft_application_widget.dart';

import 'bloc/read_write_file/read_write_file_bloc.dart';
import 'model/food.dart';

void main() {
  setUpLog();

  var logger = Logger('ALogger');
  logger.info('We are logging to file');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ReadWriteFileBloc()),
        BlocProvider(create: (context) => ApplicationBloc.instance),
        BlocProvider(create: (context) => CaptureFingerprintBloc.instance),
        BlocProvider(create: (context) => CapturePhotoBloc.instance),
        BlocProvider(create: (context) => CaptureSignatureBloc.instance),
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
        child: const Text("Fetch Data"),
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
                  return _successWidget(
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
                  return _successWidget(
                      textToDisplay: state.errorMessage,
                      sibling: _getDocsDirButton());
                }

                if (state is HomeSuccessfulGetDocsDirState) {
                  return _successWidget(
                      textToDisplay: state.path,
                      sibling: _getFileRefButton(state.path));
                }

                if (state is SuccessCreateFileInDocsDirState) {
                  return _successWidget(
                      textToDisplay: state.file.path,
                      sibling: _writeToFile(file: state.file));
                }

                if (state is SuccessWriteDataToFile) {
                  return _successWidget(
                      textToDisplay: 'File Updated',
                      sibling: _readFromFile(file: state.file));
                }

                if (state is SuccessReadFromFile) {
                  return _successWidget(
                    textToDisplay: state.contents,
                  );
                }

                if (state is ErrorCreateFileInDocsDirState) {
                  return _successWidget(textToDisplay: state.errorMessage);
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _getDocsDirButton(),
                    _readFromFile(
                        file: File(
                            '/data/user/0/com.example.test_bloc_flutter/app_flutter/my_counter.txt')),
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
  Widget _successWidget({required String textToDisplay, Widget? sibling}) {
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

  Widget _writeToFile({required File file}) {
    return TextButton(
      onPressed: () {
        readWriteFileBloc.add(
            WriteToFileEvent(file: file, stringToWrite: 'Dumelang, Africa!'));
      },
      child: Text('Write to File: ${file.path}'),
    );
  }

  Widget _readFromFile({required File file}) {
    return kIsWeb
        ? Container()
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(ReadFromFileEvent(file: file));
            },
            child: Text('Read from File: ${file.path}'),
          );
  }

  Widget _frostySampleWidget() {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: <Widget>[
          /*new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new FlutterLogo()
          ),*/
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: const Center(
                    child: Text('Frosted', style: TextStyle()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
        RouteDataDTO(
          component: _frostySampleWidget(),
          routeName: '/frosty',
        )
      ],
    );
  }
}
