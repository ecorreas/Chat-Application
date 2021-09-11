import 'package:app/app/controller/app/app_controller.dart';
import 'package:app/app/models/contact_model.dart';
import 'package:app/app/view/components/default_button.dart';
import 'package:app/app/view/components/default_textfield.dart';
import 'package:app/app/view/new%20connection/new_connection.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactBar extends StatefulWidget {
  final void Function(ContactModel) onSelect;
  const ContactBar({Key? key, required this.onSelect}) : super(key: key);

  @override
  _ContactBarState createState() => _ContactBarState();
}

class _ContactBarState extends State<ContactBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text('Contacts',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 35,
                )),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              Expanded(
                child: DefaultTextField(
                  hintText: 'Search Contacs',
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ]),
            SizedBox(
              height: 25,
            ),
            Divider(
              height: 0,
              color: AppColors.black25,
            ),
            SizedBox(
              height: 25,
            ),
            Column(
                children: List.generate(
              Provider.of<AppController>(context, listen: false)
                  .contacts
                  .length,
              (index) => ListTile(
                onTap: () {
                  widget.onSelect(
                      Provider.of<AppController>(context, listen: false)
                          .contacts[index]);
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                        Provider.of<AppController>(context, listen: false)
                            .contacts[index]
                            .name
                            .substring(0, 2)
                            .toUpperCase(),
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28,
                        )),
                  ),
                ),
                title: Text(
                    Provider.of<AppController>(context, listen: false)
                        .contacts[index]
                        .name,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                    )),
                subtitle: Text(
                    Provider.of<AppController>(context, listen: false)
                            .contacts[index]
                            .hasConection
                        ? 'Conectado'
                        : 'Sem Conexão',
                    style: TextStyle(
                      color: Provider.of<AppController>(context, listen: false)
                              .contacts[index]
                              .hasConection
                          ? Colors.green
                          : AppColors.black50,
                      fontSize: 18,
                    )),
              ),
            )),
            SizedBox(
              height: 25,
            ),
            Divider(
              height: 0,
              color: AppColors.black25,
            ),
            SizedBox(
              height: 25,
            ),
            DefaultButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NewConnection()),
                  );
                  setState(() {});
                },
                title: "New Connection")
          ],
        ),
      ),
    );
  }
}
