import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAuthTextFild extends StatelessWidget {
  final String hinText;
  final String labelText;
  final IconData icon;
  final bool obsecureText;
  final TextEditingController textEditingController;

  const CustomAuthTextFild({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.icon,
    required this.textEditingController,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: textEditingController,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(fontSize: 14, color: AppColors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        label: Text(labelText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          gapPadding: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          gapPadding: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70),
          gapPadding: 15,
        ),
      ),
    );
  }
}
