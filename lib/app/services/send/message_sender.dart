import 'dart:io';

import 'package:app/app/models/message_model.dart';

abstract class IMessageSender {
  Future<bool> send(MessageModel message);
}

class MessageSender implements IMessageSender {
  final Socket _socket;
  MessageSender(this._socket);

  @override
  Future<bool> send(MessageModel message) async {
    try {
      _socket.write(message.toJson());
    } catch (e) {
      print(e);
    }
    return true;
  }
}
