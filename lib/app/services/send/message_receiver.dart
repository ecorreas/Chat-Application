import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

abstract class IMessageReceiver {
  StreamSubscription receive();
}

class MessageReceiver implements IMessageReceiver {
  final Socket _socket;
  MessageReceiver(this._socket);

  @override
  StreamSubscription receive() {
    return _socket.listen(
      (Uint8List data) {
        print('Received: $data');
      },
      onError: (error) {
        _socket.destroy();
      },
      onDone: () {
        _socket.destroy();
      },
    );
  }
}
