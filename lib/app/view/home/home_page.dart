import 'package:app/app/controller/app/app_controller.dart';
import 'package:app/app/models/contact_model.dart';
import 'package:app/app/view/chat/chat_page.dart';
import 'package:app/app/view/contact/contact_bar.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppController appController;
  ContactModel? contactSelected;
  @override
  void initState() {
    appController = Provider.of<AppController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: <Widget>[
      ContactBar(
        onSelect: (contact) {
          setState(() {
            contactSelected = contact;
          });
        },
      ),
      VerticalDivider(
        width: 0,
        color: AppColors.black.withOpacity(0.25),
      ),
      Expanded(
        flex: 3,
        child: Container(
          color: AppColors.white,
          child: contactSelected != null
              ? ChatPage(
                  contact: contactSelected!,
                )
              : Center(
                  child: Text(
                    'Bem vindo ao\nChat Aplication',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
                  ),
                ),
        ),
      )
    ]));
  }
}
