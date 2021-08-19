// ignore_for_file: unused_element

import 'dart:convert';
import 'dart:io';

import 'package:app/app/services/send/message_receiver.dart';
import 'package:app/app/services/send/message_sender.dart';
import 'package:app/app/models/message_model.dart';

class ChatController {
  late Socket _socket;
  late IMessageSender _sender;
  late IMessageReceiver _receiver;
  late bool _state;

  Future<void> initConection({required String ip, required int port}) async {
    try {
      _socket = await Socket.connect(ip, port);
      _sender = MessageSender(_socket);
      _receiver = MessageReceiver(_socket);
      setStateConnection(true);
    } catch (e) {
      throw Exception('User refused your connection');
    }
  }

  Future<void> onReceiveMessage(
      {required void Function(MessageModel) onReceiveMessage}) async {
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

  void close() {
    _socket.handleError((e) {
      print(e);
    });
    _socket.close();
    setStateConnection(false);
  }

  void setStateConnection(bool state) {
    this._state = state;
  }

  bool getStateConnection() {
    return _state;
  }
}
