import 'package:course/controllers/auth/register_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/functions/input_validation.dart';
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
            height: Get.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: registerController.formState,
              child: Column(
                children: [
                  const CustomAuthHeaderText(
                      title: "Register Account",
                      bodyText:
                          "Complete your details\n or continue with social media."),
                  const SizedBox(height: 10),
                  CustomAuthTextFild(
                    hinText: "Enter your username",
                    labelText: "Username",
                    icon: Icons.person_outline,
                    textEditingController: registerController.username,
                    validator: (value) => validateInput(
                        value: value!,
                        type: InputTypes.username,
                        inputName: "Username",
                        max: 50,
                        min: 8),
                  ),
                  const SizedBox(height: 20),
                  CustomAuthTextFild(
                    hinText: "Enter your Email",
                    labelText: "Email",
                    icon: Icons.email_outlined,
                    textEditingController: registerController.email,
                    validator: (value) => validateInput(
                        value: value!,
                        type: InputTypes.email,
                        inputName: "Email",
                        max: 50,
                        min: 8),
                  ),
                  const SizedBox(height: 20),
                  CustomAuthTextFild(
                    hinText: "Enter your phone number",
                    labelText: "Phone",
                    icon: Icons.phone_outlined,
                    textEditingController: registerController.phone,
                    obsecureText: true,
                    validator: (value) => validateInput(
                        value: value!,
                        type: InputTypes.phone,
                        inputName: "Phone number",
                        max: 11,
                        min: 9),
                  ),
                  const SizedBox(height: 20),
                  CustomAuthTextFild(
                    hinText: "Enter your password",
                    labelText: "Password",
                    icon: Icons.key_outlined,
                    textEditingController: registerController.password,
                    obsecureText: true,
                    validator: (value) => validatePasswordAndConfirmation(
                        password: registerController.password.text,
                        confirmation:
                            registerController.passwordConfirmation.text,
                        inputName: "Password",
                        max: 50,
                        min: 8),
                  ),
                  const SizedBox(height: 20),
                  CustomAuthTextFild(
                    hinText: "Re-enter your password",
                    labelText: "Confirm Password",
                    icon: Icons.key_outlined,
                    textEditingController:
                        registerController.passwordConfirmation,
                    obsecureText: true,
                    validator: (value) => validatePasswordAndConfirmation(
                        password: registerController.password.text,
                        confirmation:
                            registerController.passwordConfirmation.text,
                        inputName: "Confirmation",
                        max: 50,
                        min: 8),
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
                  const Spacer(flex: 10),
                ],
              ),
            ),
          ),
        ));
  }
}
