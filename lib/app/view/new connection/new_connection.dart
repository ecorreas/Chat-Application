import 'package:app/app/controller/app/app_controller.dart';
import 'package:app/app/controller/chat/chat_controller.dart';
import 'package:app/app/models/contact_model.dart';
import 'package:app/app/view/chat/components/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:app/app/view/components/default_button.dart';
import 'package:app/app/view/components/default_textfield.dart';
import 'package:provider/provider.dart';

class NewConnection extends StatefulWidget {
  NewConnection({Key? key}) : super(key: key);

  @override
  _NewConnectionState createState() => _NewConnectionState();
}

class _NewConnectionState extends State<NewConnection> {
  final controllerIP = TextEditingController();
  final controllerPort = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 532,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                child: DefaultTextField(
                  hintText: 'IP',
                  controller: controllerIP,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 85,
                child: DefaultTextField(
                  hintText: 'Port',
                  controller: controllerPort,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              DefaultButton(
                  width: 100,
                  onPressed: () async {
                    DefaultAlertDialog.showLoading(context,
                        barrierDismissible: true);
                    bool hasError = false;
                    final newController = ChatController();
                    await newController
                        .initConection(
                            ip: controllerIP.text,
                            port: int.parse(controllerPort.text))
                        .catchError((e) {
                      Navigator.pop(context);
                      hasError = true;
                      DefaultAlertDialog.show(context,
                          message: e.message, barrierDismissible: true);
                    });
                    if (!hasError) {
                      await DefaultAlertDialog.show(context,
                              message: 'Conection successful',
                              barrierDismissible: true)
                          .whenComplete(() {
                        Provider.of<AppController>(context, listen: false)
                            .contacts
                            .add(ContactModel(
                                chatController: newController,
                                ip: controllerIP.text,
                                port: int.parse(controllerPort.text),
                                name: controllerIP.text,
                                hasConection: true,
                                messages: []));
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    }
                  },
                  title: 'Connect'),
              SizedBox(
                width: 10,
              ),
              DefaultButton(
                  width: 100,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: 'Cancel'),
            ],
          ),
        ),
      ),
    );
  }
}
