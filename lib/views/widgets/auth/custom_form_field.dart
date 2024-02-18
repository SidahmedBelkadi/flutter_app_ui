import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAuthTextFild extends StatelessWidget {
  final String hinText;
  final String labelText;
  final IconData icon;
  final void Function()? onObsecureIconTap;
  final bool obsecureText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?) validator;

  const CustomAuthTextFild({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.icon,
    required this.textEditingController,
    this.obsecureText = false,
    required this.validator,
    required this.textInputType,
    this.onObsecureIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: textEditingController,
      obscureText: obsecureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(fontSize: 14, color: AppColors.grey),
        errorStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        label: Text(labelText),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InkWell(
          onTap: onObsecureIconTap,
          child: Icon(icon),
        ),
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
