import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BarNameConectionComponet extends StatelessWidget {
  final String name;
  final bool isConnected;
  const BarNameConectionComponet(
      {Key? key, required this.name, required this.isConnected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
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
            isConnected ? 'Conectado' : 'Sem Conexão',
            style: TextStyle(
                color: isConnected ? Colors.green : AppColors.black50,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
