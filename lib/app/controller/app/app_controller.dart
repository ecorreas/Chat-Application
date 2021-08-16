import 'package:app/app/controller/chat/chat_controller.dart';
import 'package:app/app/models/contact_model.dart';
import 'package:app/app/models/message_model.dart';

ChatController state = new ChatController();

class AppController {
  String identification = 'Matheus';

  List<ChatController> chatsControllers = [];

  List<ContactModel> contacts = [
    ContactModel(
        chatController: ChatController(),
        ip: 'localhost',
        port: 4567,
        name: "Evandro",
        hasConection: state.getStateConnection(),
        messages: [
          MessageModel(message: 'Eai man', indentification: 'Evandro'),
          MessageModel(message: 'Fala tu', indentification: 'Matheus')
        ])
  ];
}