part of 'web_socket_bloc.dart';

abstract class WebSocketState extends Equatable {
  const WebSocketState();

  @override
  List<Object> get props => [];
}

class WebSocketInitial extends WebSocketState {}

/// successful connect to websocket
class SuccessConnectToServer extends WebSocketState {
  final WebSocketChannel channel;

  const SuccessConnectToServer(this.channel);

  @override
  List<Object> get props => [channel];
}

/// error connecting to server
class ErrorConnectToServer extends WebSocketState {
  final String errorMessage;

  const ErrorConnectToServer({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

/// successful send data to websocket
class SuccessSendDataToServer extends WebSocketState {
  final WebSocketChannel channel;

  const SuccessSendDataToServer(this.channel);

  @override
  List<Object> get props => [channel];
}

/// error send data to server
class ErrorSendDataToServer extends WebSocketState {
  final String errorMessage;

  const ErrorSendDataToServer({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
