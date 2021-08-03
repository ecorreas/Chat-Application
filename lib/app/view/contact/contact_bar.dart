import 'package:app/app/view/components/default_textfield.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContactBar extends StatefulWidget {
  const ContactBar({Key? key}) : super(key: key);

  @override
  _ContactBarState createState() => _ContactBarState();
}

class _ContactBarState extends State<ContactBar> {
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
            ListTile(
              minLeadingWidth: 70,
              leading: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: Center(
                  child: Text('AG',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 28,
                      )),
                ),
              ),
              title: Text('Auri Gabriel',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                  )),
              subtitle: Text('Sem Conexão',
                  style: TextStyle(
                    color: AppColors.black50,
                    fontSize: 18,
                  )),
            ),
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
          ],
        ),
      ),
    );
  }
}
