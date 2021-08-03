import 'dart:convert';
import 'dart:io';

import 'package:app/app/services/send/message_receiver.dart';
import 'package:app/app/services/send/message_sender.dart';
import 'package:app/app/models/message_model.dart';

class ChatController {
  late Socket _socket;
  late IMessageSender _sender;
  late IMessageReceiver _receiver;

  Future<void> initConection() async {
    _socket = await Socket.connect('localhost', 4567);
    _sender = MessageSender(_socket);
    _receiver = MessageReceiver(_socket);
    _receiver.receive().onData((data) {
      final message = String.fromCharCodes(data);
      final map = jsonDecode(message);
      final result = MessageModel.fromMap(map);
      print(result.message);
    });
  }

  Future<void> sendMessage(String message) {
    return _sender
        .send(MessageModel(message: message, indentification: 'Matheus'));
  }

  void close() {
    _socket.close();
  }
}
