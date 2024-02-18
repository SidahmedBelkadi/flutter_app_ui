import 'package:course/controllers/auth/success_sign_up_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpController successSignUpController =
        Get.put(SuccessSignUpController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Icon(
              Icons.check_circle_outline_outlined,
              color: AppColors.primaryColor,
              size: 200,
            ),
            const SizedBox(height: 10),
            Text(
              "You have complete the Sign up process with success.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(flex: 3),
            CustomAuthButton(
                buttonText: "Login",
                onPressed: () => successSignUpController.goToLogin()),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
