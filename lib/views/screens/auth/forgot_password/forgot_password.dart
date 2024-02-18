import 'package:course/controllers/auth/forgot_password_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/functions/input_validation.dart';
import 'package:course/views/widgets/auth/custom_button.dart';
import 'package:course/views/widgets/auth/custom_form_field.dart';
import 'package:course/views/widgets/auth/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController forgotPasswordController =
        Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              const CustomAuthHeaderText(
                  title: "Check Email",
                  bodyText:
                      "Please enter your email and we will send\n you a link to return your account."),
              const SizedBox(height: 50),
              Form(
                key: forgotPasswordController.formState,
                child: CustomAuthTextFild(
                  hinText: "Enter your Email",
                  labelText: "Email",
                  icon: Icons.email_outlined,
                  textEditingController: forgotPasswordController.email,
                  validator: (value) => validateInput(
                      value: value!,
                      type: InputTypes.email,
                      inputName: "Email",
                      max: 50,
                      min: 8),
                  textInputType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 30),
              CustomAuthButton(
                  buttonText: "Check",
                  onPressed: () {
                    forgotPasswordController.checkEmail();
                  }),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
