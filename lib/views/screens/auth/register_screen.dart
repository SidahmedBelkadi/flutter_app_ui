import 'package:course/controllers/auth/register_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/auth/custom_button.dart';
import 'package:course/views/widgets/auth/custom_form_field.dart';
import 'package:course/views/widgets/auth/custom_header_text.dart';
import 'package:course/views/widgets/auth/question_possesion_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign Up",
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
              children: [
                const SizedBox(height: 30),
                const CustomAuthHeaderText(
                    title: "Register Account",
                    bodyText:
                        "Complete your details\n or continue with social media."),
                const SizedBox(height: 50),
                CustomAuthTextFild(
                  hinText: "Enter your username",
                  labelText: "Username",
                  icon: Icons.person_outline,
                  textEditingController: registerController.username,
                ),
                const SizedBox(height: 30),
                CustomAuthTextFild(
                  hinText: "Enter your Email",
                  labelText: "Email",
                  icon: Icons.email_outlined,
                  textEditingController: registerController.email,
                ),
                const SizedBox(height: 30),
                CustomAuthTextFild(
                  hinText: "Enter your phone number",
                  labelText: "Phone",
                  icon: Icons.phone_outlined,
                  textEditingController: registerController.phone,
                  obsecureText: true,
                ),
                const SizedBox(height: 30),
                CustomAuthTextFild(
                  hinText: "Enter your password",
                  labelText: "Password",
                  icon: Icons.key_outlined,
                  textEditingController: registerController.password,
                  obsecureText: true,
                ),
                const SizedBox(height: 30),
                CustomAuthTextFild(
                  hinText: "Re-enter your password",
                  labelText: "Confirm Password",
                  icon: Icons.key_outlined,
                  textEditingController:
                      registerController.passwordConfirmation,
                  obsecureText: true,
                ),
                const SizedBox(height: 20),
                CustomAuthButton(
                    buttonText: "Sign up",
                    onPressed: () => registerController.register()),
                const Spacer(),
                QuestionAboutPossesionOfAccountAuth(
                  question: "Already have an account?",
                  linkText: "Sign In",
                  onPressed: () => registerController.goToLogin(),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ));
  }
}
