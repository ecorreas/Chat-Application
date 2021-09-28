import 'dart:io';

abstract class IMessageReceiver {
  Socket receive();
}

class MessageReceiver implements IMessageReceiver {
  final Socket _socket;
  MessageReceiver(this._socket);

  @override
  Socket receive() {
    return _socket;
  }
}
