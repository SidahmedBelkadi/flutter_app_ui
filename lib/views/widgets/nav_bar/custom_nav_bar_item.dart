import 'package:flutter/material.dart';

class CustomBottomAppBarItem extends StatelessWidget {
  // final String title;
  final IconData icon;
  final void Function()? onPressed;
  final bool active;

  const CustomBottomAppBarItem({
    super.key,
    // required this.title,
    required this.icon,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 25,
        color: active ? Colors.white : Colors.white70,
      ),
    );
  }
}
