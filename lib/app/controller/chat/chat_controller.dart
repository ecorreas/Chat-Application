import 'dart:convert';
import 'dart:io';

import 'package:app/app/services/send/message_receiver.dart';
import 'package:app/app/services/send/message_sender.dart';
import 'package:app/app/models/message_model.dart';

class ChatController {
  late Socket _socket;
  late IMessageSender _sender;
  late IMessageReceiver _receiver;

  Future<void> initConection({required String ip, required int port}) async {
    try {
      _socket = await Socket.connect(ip, port);
      _sender = MessageSender(_socket);
      _receiver = MessageReceiver(_socket);
    } catch (e) {
      throw Exception('User refused your connection');
    }
  }

  Future<void> onReceiveMessage(
      {required void Function(MessageModel) onReceiveMessage,
      required void Function() onDone}) async {
    _receiver.receive().listen((event) {
      final message = String.fromCharCodes(event);
      final map = jsonDecode(message);
      final result = MessageModel.fromMap(map);
      print(result.message);
      onReceiveMessage(result);
    }, onDone: onDone);
  }

  Future<bool> sendMessage({required MessageModel message}) async {
    final result = await _sender.send(message);
    return result;
  }

  void close() {
    _socket.handleError((e) {
      print(e);
    });
    _socket.close();
  }
}
