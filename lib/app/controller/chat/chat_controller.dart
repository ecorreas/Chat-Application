import 'dart:convert';
import 'dart:io';

import 'package:app/app/services/send/message_receiver.dart';
import 'package:app/app/services/send/message_sender.dart';
import 'package:app/app/models/message_model.dart';

class ChatController {
  late Socket _socket;
  late IMessageSender _sender;
  late IMessageReceiver _receiver;

  Future<void> initConection(
      {required void Function(MessageModel) onReceiveMessage}) async {
    _socket = await Socket.connect('localhost', 4567);
    _sender = MessageSender(_socket);
    _receiver = MessageReceiver(_socket);
    _receiver.receive().onData((data) {
      final message = String.fromCharCodes(data);
      final map = jsonDecode(message);
      final result = MessageModel.fromMap(map);
      print(result.message);
      onReceiveMessage(result);
    });
  }

  Future<bool> sendMessage({required MessageModel message}) async {
    final result = await _sender.send(message);
    return result;
  }

  MessageModel onReceiveMessage(MessageModel message) {
    return message;
  }

  void close() {
    _socket.close();
  }
}
