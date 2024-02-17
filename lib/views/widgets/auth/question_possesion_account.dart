import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class QuestionAboutPossesionOfAccountAuth extends StatelessWidget {
  final String question;
  final String linkText;
  final void Function()? onPressed;
  const QuestionAboutPossesionOfAccountAuth({
    super.key,
    required this.question,
    required this.linkText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        TextButton(
          onPressed: onPressed,
          child: Text(
            linkText,
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
