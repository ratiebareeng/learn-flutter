import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _server1 = 'wss://echo.websocket.events';
  static const String _server2 = 'wss://socketsbay.com/wss/v2/1/demo/';
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse(_server2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: disconnect,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                      'Error sending data: ${snapshot.error.toString()}');
                }
                if (snapshot.hasData) {
                  log(snapshot.data.toString());
                  //Map snapMap = jsonEncode(jsonDecode(snapshot.data)) as Map;
                }
                return snapshot.hasData
                    ? ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data[0].toString())),
                        title:
                            Text(snapshot.hasData ? snapshot.toString() : ''),
                      )
                    : const Text('data');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
      _controller.text = '';
    }
  }

  void disconnect() {
    _channel.sink.close();
  }

  @override
  void dispose() {
    disconnect();
    _controller.dispose();
    super.dispose();
  }
}


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