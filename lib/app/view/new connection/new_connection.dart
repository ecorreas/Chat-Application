import 'package:flutter/material.dart';
import 'package:app/app/view/components/default_button.dart';
import 'package:app/app/view/components/default_textfield.dart';

class NewConnection extends StatefulWidget {
  NewConnection({Key? key}) : super(key: key);

  @override
  _NewConnectionState createState() => _NewConnectionState();
}

class _NewConnectionState extends State<NewConnection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(400),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: DefaultTextField(
                    hintText: 'IP',
                  )),
                  Expanded(
                      child: DefaultButton(onPressed: () {}, title: 'Connect')),
                  Expanded(
                      child: DefaultButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Cancel'))
                ],
              ),
            )),
      ),
    );
  }
}
