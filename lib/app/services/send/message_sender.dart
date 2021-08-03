import 'dart:io';

import 'package:app/app/models/message_model.dart';

abstract class IMessageSender {
  Future<void> send(MessageModel message);
}

class MessageSender implements IMessageSender {
  final Socket _socket;
  MessageSender(this._socket);

  @override
  Future<void> send(MessageModel message) async {
    _socket.write(message.toJson());
  }
}
