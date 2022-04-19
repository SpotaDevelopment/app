import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketClient {
  WebSocketChannel channel;

  WebSocketClient(this.channel);

  
  void sendMessage(String message) {
    channel.sink.add(message);
  }

  void close() {
    channel.sink.close();
  }
}