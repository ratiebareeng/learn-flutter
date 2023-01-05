// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_bloc.dart';
import 'package:test_bloc_flutter/bloc/web_socket_bloc/web_socket_bloc.dart';
import 'package:test_bloc_flutter/ui/fetch_data/fetch_data.dart';
import 'package:test_bloc_flutter/ui/read_write_file/read_write_file.dart';
import 'package:test_bloc_flutter/ui/web_socket/web_socket_page.dart';

import 'bloc/home_bloc/home_event.dart';
import 'bloc/read_write_file/read_write_file_bloc.dart';
import 'logging/log_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLog(logFileName: 'tft_log');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ReadWriteFileBloc()),
        BlocProvider(create: (context) => WebSocketBloc()),
      ],
      child: const MaterialApp(home: HomeSreen()),
    ),
  );
}

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  late ReadWriteFileBloc readWriteFileBloc;
  late HomeBloc homeBloc;
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    readWriteFileBloc = context.read<ReadWriteFileBloc>();
  }

  Widget _navigate({
    required String pageName,
    required Widget page,
    required BuildContext context,
  }) {
    return TextButton(
      onPressed: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(pageName),
    );
  }

  Widget _mainComponent(buildContext) {
    return Scaffold(
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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // home bloc
            _navigate(
                pageName: 'Home Bloc',
                page: const FetchDataWidget(),
                context: buildContext),
            TextButton(
              onPressed: () {
                Navigator.push(
                  buildContext,
                  MaterialPageRoute(
                    builder: (buildContext) => const FetchDataWidget(),
                  ),
                );
              },
              child: const Text('Home Bloc'),
            ),
            // read write bloc
            _navigate(
                pageName: 'Read Write File',
                page: const ReadWriteFile(),
                context: buildContext),
            // websocket bloc
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // home bloc
            _navigate(
              pageName: 'Home Bloc',
              page: const FetchDataWidget(),
              context: context,
            ),

            // read write bloc
            _navigate(
              pageName: 'Read Write File',
              page: const ReadWriteFile(),
              context: context,
            ),
            // websocket bloc
            _navigate(
              pageName: 'WebSockets',
              page: const WebSocketPage(),
              context: context,
            ),
          ],
        ),
      ),
    );
    /*  return TFTApplication(
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
          component: _mainComponent(context),
          routeName: '/',
        ),
      ],
    ); */
  }
}
