import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/web_socket_bloc/web_socket_bloc.dart';

class WebSocketPage extends StatefulWidget {
  const WebSocketPage({
    super.key,
  });

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  final TextEditingController _controller = TextEditingController();
  /* final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  ); */
  final _serverUrl = 'wss://echo.websocket.events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket BloC'),
      ),
      body: BlocConsumer<WebSocketBloc, WebSocketState>(
        listener: (context, state) {
          if (state is SuccessConnectToServer) {
            FlushbarHelper.createError(
              message: 'Connected to server: ${state.channel.toString()}',
            );
          } else if (state is ErrorConnectToServer) {
            FlushbarHelper.createError(
              message: state
                  .errorMessage, //'Connected to server: ${state.channel.toString()}',
            );
          }
        },
        builder: (context, state) {
          if (state is SuccessConnectToServer) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    child: TextFormField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(labelText: 'Send a message'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  StreamBuilder(
                    stream: state.channel.stream, //_channel.stream,
                    builder: (context, snapshot) {
                      return Text(
                          snapshot.hasData ? '${snapshot.data}' : 'No Data');
                    },
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                      onPressed: () => _sendMessage(state),
                      child: const Text('Send Message')),
                ],
              ),
            );
          }
          if (state is SuccessSendDataToServer) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    child: TextFormField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(labelText: 'Send a message'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  StreamBuilder(
                    stream: state.channel.stream, //_channel.stream,
                    builder: (context, snapshot) {
                      return Text(
                          snapshot.hasData ? '${snapshot.data}' : 'No Data');
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
            child: TextButton(
              onPressed: () {
                context
                    .read<WebSocketBloc>()
                    .add(ConnectToServerEvent(_serverUrl));
              },
              child: const Text('Connect to Server'),
            ),
          );
        },
      ),
    );
  }

  void _sendMessage(SuccessConnectToServer state) {
    if (_controller.text.isNotEmpty) {
      // _channel.sink.add(_controller.text);
      context.read<WebSocketBloc>().add(
            SendDataToServerEvent(
              _controller.text,
              state.channel,
            ),
          );
    }
  }

  @override
  void dispose() {
    //_channel.sink.close();
    //context.read<WebSocketBloc>().add(CleanUpEvent());
    _controller.dispose();
    super.dispose();
  }
}
