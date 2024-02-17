import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLanguagesButton extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomLanguagesButton({
    super.key,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: AppColors.primaryColor,
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
