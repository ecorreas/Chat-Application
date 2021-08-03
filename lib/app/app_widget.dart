import 'package:app/app/view/chat/chat_page.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Aplication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, backgroundColor: AppColors.white),
      home: ChatPage(),
    );
  }
}
