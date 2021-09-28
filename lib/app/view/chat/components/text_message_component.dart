import 'package:app/app/models/message_model.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextMessageComponent extends StatelessWidget {
  final MessageModel message;
  final bool received;
  const TextMessageComponent(
      {Key? key, required this.message, required this.received})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: !received ? AppColors.white : AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        border: !received ? Border.all(color: AppColors.black50) : null,
      ),
      child: Text(
        message.message,
        style: TextStyle(
          fontSize: 15,
          color: received ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
