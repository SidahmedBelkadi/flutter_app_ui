import 'package:course/controllers/auth/check_email_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/auth/custom_button.dart';
import 'package:course/views/widgets/auth/custom_form_field.dart';
import 'package:course/views/widgets/auth/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailController checkEmailController = Get.put(CheckEmailController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check Email",
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
                  title: "Success Email",
                  bodyText:
                      "Please enter your email and we will send\n you a link to return your account."),
              const SizedBox(height: 50),
              CustomAuthTextFild(
                hinText: "Enter your Email",
                labelText: "Email",
                icon: Icons.email_outlined,
                textEditingController: checkEmailController.email,
              ),
              const SizedBox(height: 30),
              CustomAuthButton(
                  buttonText: "Check",
                  onPressed: () {
                    checkEmailController.goToSuccessSignUp();
                  }),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
