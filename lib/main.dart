// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_flutter/bloc/home_bloc/home_bloc.dart';
import 'package:test_bloc_flutter/bloc/web_socket_bloc/web_socket_bloc.dart';
import 'package:test_bloc_flutter/extensions/random_extenstion.dart';
import 'package:test_bloc_flutter/ui/fetch_data/fetch_data.dart';
import 'package:test_bloc_flutter/ui/navigate_x_page.dart';
import 'package:test_bloc_flutter/ui/pdfs/pdf_page.dart';
import 'package:test_bloc_flutter/ui/read_write_file/read_write_file.dart';
import 'package:test_bloc_flutter/ui/web_socket/web_socket_page.dart';
import 'package:test_bloc_flutter/ui/widgets/advanced_animation.dart';
import 'package:test_bloc_flutter/ui/widgets/basic_animation_page.dart';

import 'bloc/home_bloc/home_event.dart';
import 'bloc/read_write_file/read_write_file_bloc.dart';
import 'extensions/navigator_extension.dart';
import 'logging/log_settings.dart' as myLog;
import 'logging/log_settings.dart';

void main() async {
  myLog.setUpLog(logFileName: 'tft_log');
  sendErrorReportToBackend(true);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ReadWriteFileBloc()),
        BlocProvider(create: (context) => WebSocketBloc()),
      ],
      child: MaterialApp(
        home: const HomeSreen(),
        routes: {
          '/testX': (context) => const TestX(),
          '/basic-anim': (context) => const AnimationPage(),
          '/adv-anim': (context) => const AdvancedAnimationPage(),
          '/pdf': (context) => const PdfPage(),
        },
      ),
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
  }) =>
      TextButton(
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(pageName),
      );

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
            TextButton(
              onPressed: () {
                reportError();
                // navigator extension
                /* NavigatorJsonX.pushNamedRouteFromJson(
                  context,
                  '{"route": "/testX", "arguments": {"year": "2023"}}',
                ); */
              },
              child: const Text('NavigatorX'),
            ),
            TextButton(
              onPressed: () {
                // navigator extension
                NavigatorJsonX.pushNamedRouteFromJson(
                  context,
                  '{"route": "/pdf"}',
                );
              },
              child: const Text('PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
