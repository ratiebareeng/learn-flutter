import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'web_socket_event.dart';
part 'web_socket_state.dart';

class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  WebSocketBloc() : super(WebSocketInitial()) {
    on<ConnectToServerEvent>(_connectToServer);
    on<SendDataToServerEvent>(_sendDataToServer);
    on<CleanUpEvent>(_cleanUp);
  }

  void _connectToServer(
    ConnectToServerEvent event,
    Emitter emitter,
  ) {
    try {
      emitter(WebSocketInitial());
      // get uri
      Uri serverUrl = Uri.parse(event.serverUrl);
      // connect to server at uri
      final channel = WebSocketChannel.connect(serverUrl);

      emitter(SuccessConnectToServer(channel));
    } on FormatException catch (e) {
      /// If the [uri] string is not valid as a URI or URI reference
      emitter(ErrorConnectToServer(errorMessage: e.message));
    }
  }

  void _sendDataToServer(
    SendDataToServerEvent event,
    Emitter emitter,
  ) {
    emitter(WebSocketInitial());
    // The WebSocketChannel provides a StreamSink to push messages to the server.
    event.channel.sink.add(event.dataToSend);
    emitter(SuccessSendDataToServer(event.channel));
  }

  void _cleanUp(
    CleanUpEvent event,
    Emitter emitter,
  ) async {
    event.channel.sink.close();
    emitter(WebSocketInitial());
  }
}
