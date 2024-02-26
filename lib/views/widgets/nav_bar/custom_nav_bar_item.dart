import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final bool active;

  const CustomBottomAppBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color:
                  active ? AppColors.secondaryColor : AppColors.primaryColor),
          Text(
            title,
            style: TextStyle(
              color: active ? AppColors.secondaryColor : AppColors.primaryColor,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
