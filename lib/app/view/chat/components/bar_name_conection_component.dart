import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BarNameConectionComponet extends StatelessWidget {
  const BarNameConectionComponet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Auri Gabriel',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 25,
          ),
          Container(
            height: 20,
            child: VerticalDivider(
              width: 0,
              color: AppColors.black.withOpacity(0.25),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            'Sem conexão',
            style: TextStyle(
                color: AppColors.black50,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
