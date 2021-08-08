import 'package:app/app/controller/app/app_controller.dart';
import 'package:app/app/controller/chat/chat_controller.dart';
import 'package:app/app/models/contact_model.dart';
import 'package:app/app/models/message_model.dart';
import 'package:app/app/view/chat/components/bar_name_conection_component.dart';
import 'package:app/app/view/chat/components/text_message_component.dart';
import 'package:app/app/view/components/default_button.dart';
import 'package:app/app/view/components/default_textfield.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final ContactModel contact;
  const ChatPage({Key? key, required this.contact}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late AppController appController;
  final controller = ChatController();
  final message = TextEditingController();
  @override
  void initState() {
    appController = Provider.of<AppController>(context, listen: false);
    super.initState();
    controller.initConection(onReceiveMessage: (message) {
      setState(() {
        for (var contact in appController.contacts) {
          if ('${contact.ip}:${contact.port}' ==
              '${widget.contact.ip}:${widget.contact.port}') {
            contact.messages.add(message);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      BarNameConectionComponet(
        name: widget.contact.name,
        isConnected: widget.contact.hasConection,
      ),
      Divider(
        height: 0,
        color: AppColors.black.withOpacity(0.25),
      ),
      Expanded(
          flex: 10,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            children: List.generate(
                widget.contact.messages.length,
                (index) => Align(
                      alignment:
                          widget.contact.messages[index].indentification !=
                                  appController.identification
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextMessageComponent(
                            received: widget
                                    .contact.messages[index].indentification !=
                                appController.identification,
                            message: widget.contact.messages[index]),
                      ),
                    )),
          )),
      Divider(
        height: 0,
        color: AppColors.black.withOpacity(0.25),
      ),
      Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: DefaultTextField(
                  hintText: 'Write a message',
                  controller: message,
                )),
            SizedBox(
              width: 25,
            ),
            DefaultButton(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.height * 0.1,
                onPressed: () async {
                  final messageModel = MessageModel(
                      message: message.text,
                      indentification: appController.identification);
                  setState(() {
                    if (message.text.isNotEmpty) {
                      for (var contact in appController.contacts) {
                        if ('${contact.ip}:${contact.port}' ==
                            '${widget.contact.ip}:${widget.contact.port}') {
                          contact.messages.add(messageModel);
                        }
                      }
                      message.text = '';
                    }
                  });
                  await controller.sendMessage(message: messageModel);
                  setState(() {});
                },
                title: 'Send')
          ],
        ),
      ),
    ]);
  }
}
