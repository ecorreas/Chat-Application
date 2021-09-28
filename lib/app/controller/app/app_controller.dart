import 'package:app/app/controller/chat/chat_controller.dart';
import 'package:app/app/models/contact_model.dart';
import 'package:app/app/models/message_model.dart';

class AppController {
  String identification = 'Matheus';

  List<ChatController> chatsControllers = [];

  List<ContactModel> contacts = [
    ContactModel(
        chatController: ChatController(),
        ip: 'localhost',
        port: 4568,
        name: "Evandro",
        hasConection: true,
        messages: [
          MessageModel(message: 'Eai man', indentification: 'Evandro'),
          MessageModel(message: 'Fala tu', indentification: 'Matheus')
        ])
  ];
}
