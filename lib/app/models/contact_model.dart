import 'package:app/app/controller/chat/chat_controller.dart';
import 'package:app/app/models/message_model.dart';

class ContactModel {
  String ip;
  int port;
  String name;
  bool hasConection;
  List<MessageModel> messages;
  ChatController chatController;

  ContactModel({
    required this.ip,
    required this.port,
    required this.name,
    required this.hasConection,
    required this.messages,
    required this.chatController
  });
}
