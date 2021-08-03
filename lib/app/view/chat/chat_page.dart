import 'package:app/app/controller/app/app_controller.dart';
import 'package:app/app/models/message_model.dart';
import 'package:app/app/view/chat/components/bar_name_conection_component.dart';
import 'package:app/app/view/chat/components/text_message_component.dart';
import 'package:app/app/view/components/default_button.dart';
import 'package:app/app/view/components/default_textfield.dart';
import 'package:app/app/view/contact/contact_bar.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late AppController appController;
  @override
  void initState() {
    appController = Provider.of<AppController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: <Widget>[
      ContactBar(),
      VerticalDivider(
        width: 0,
        color: AppColors.black.withOpacity(0.25),
      ),
      Expanded(
        flex: 3,
        child: Container(
          color: AppColors.white,
          child: Column(children: <Widget>[
            BarNameConectionComponet(),
            Divider(
              height: 0,
              color: AppColors.black.withOpacity(0.25),
            ),
            Expanded(
                flex: 10,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  children: List.generate(
                      20,
                      (index) => Align(
                            alignment: index == 0
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextMessageComponent(
                                  received: index == 0,
                                  message: MessageModel(
                                      indentification: '',
                                      message: 'eai corninho')),
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
                      )),
                  SizedBox(
                    width: 25,
                  ),
                  DefaultButton(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.height * 0.1,
                      onPressed: () {},
                      title: 'Send')
                ],
              ),
            ),
          ]),
        ),
      )
    ]));
  }
}
