import 'package:course/controllers/auth/reset_password_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/functions/input_validation.dart';
import 'package:course/views/widgets/auth/custom_button.dart';
import 'package:course/views/widgets/auth/custom_form_field.dart';
import 'package:course/views/widgets/auth/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController =
        Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
            key: resetPasswordController.formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                const CustomAuthHeaderText(
                    title: "New Password",
                    bodyText: "Please enter a new password"),
                const SizedBox(height: 50),
                CustomAuthTextFild(
                  hinText: "Enter the new password",
                  labelText: "Password",
                  icon: Icons.key_outlined,
                  textEditingController: resetPasswordController.password,
                  obsecureText: true,
                  validator: (value) => validatePasswordAndConfirmation(
                      password: resetPasswordController.password.text,
                      confirmation:
                          resetPasswordController.passwordConfirmation.text,
                      inputName: "Password",
                      max: 50,
                      min: 8),
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                CustomAuthTextFild(
                  hinText: "Re-enter your password",
                  labelText: "Confirm Password",
                  icon: Icons.key_outlined,
                  textEditingController:
                      resetPasswordController.passwordConfirmation,
                  obsecureText: true,
                  validator: (value) => validatePasswordAndConfirmation(
                      password: resetPasswordController.password.text,
                      confirmation:
                          resetPasswordController.passwordConfirmation.text,
                      inputName: "Confirmation",
                      max: 50,
                      min: 8),
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 30),
                CustomAuthButton(
                    buttonText: "Confirm",
                    onPressed: () {
                      resetPasswordController.resetPassword();
                    }),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
