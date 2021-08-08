import 'package:app/app/models/contact_model.dart';
import 'package:app/app/models/message_model.dart';

class AppController {
  String identification = 'Matheus';

  List<ContactModel> contacts = [
    ContactModel(
        ip: 'localhost',
        port: 5544,
        name: "Auri",
        hasConection: false,
        messages: []),
    ContactModel(
        ip: 'localhost',
        port: 4567,
        name: "Evandro",
        hasConection: true,
        messages: [
          MessageModel(message: 'Eai man', indentification: 'Evandro'),
          MessageModel(message: 'Fala tu', indentification: 'Matheus')
        ])
  ];
}
