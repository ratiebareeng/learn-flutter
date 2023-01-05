part of 'web_socket_bloc.dart';

abstract class WebSocketEvent extends Equatable {
  const WebSocketEvent();

  @override
  List<Object> get props => [];
}

/// connect to server event
class ConnectToServerEvent extends WebSocketEvent {
  final String serverUrl;

  const ConnectToServerEvent(this.serverUrl);
  @override
  List<Object> get props => [serverUrl];
}

/// send data to server event
class SendDataToServerEvent extends WebSocketEvent {
  final String dataToSend;
  final WebSocketChannel channel;

  const SendDataToServerEvent(this.dataToSend, this.channel);
  @override
  List<Object> get props => [dataToSend, channel];
}

/// cleanup
class CleanUpEvent extends WebSocketEvent {
  final WebSocketChannel channel;

  const CleanUpEvent(this.channel);

  @override
  List<Object> get props => [channel];
}
