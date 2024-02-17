import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success reset password",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
      ),
    );
  }
}
