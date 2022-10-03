import 'dart:async';

import 'package:web_socket_channel/io.dart';

Future<void> initWs() async {
  await Future.delayed(const Duration(seconds: 3));
  String uuid = "12345678";
  IOWebSocketChannel? channel = await _connect(uuid);
  if (channel != null) {
    channel.stream.listen(
      (message) {
        _handleMessage(message);
      },
      // onError: (Object error, StackTrace stackTrace) {},
      onDone: () {
        // 此处进行重连
        _connect(uuid);
      },
    );
  }
}

Future<IOWebSocketChannel?> _connect(String uuid) async {
  return IOWebSocketChannel.connect('ws://xxx.xxx.com/ws?uuid=$uuid', pingInterval: const Duration(seconds: 60));
}

void _handleMessage(message) {
  print("ws.msg = $message");
}
