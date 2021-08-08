import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  const DefaultTextField({Key? key, this.controller, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.light,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: this.hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
