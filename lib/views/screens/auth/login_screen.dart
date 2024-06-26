import 'package:course/controllers/auth/login_controller.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/functions/alert_exit_app.dart';
import 'package:course/core/functions/input_validation.dart';
import 'package:course/core/functions/loading_form.dart';
import 'package:course/views/widgets/auth/custom_button.dart';
import 'package:course/views/widgets/auth/custom_header_text.dart';
import 'package:course/views/widgets/auth/custom_form_field.dart';
import 'package:course/views/widgets/auth/custom_logo.dart';
import 'package:course/views/widgets/auth/question_possesion_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (!didPop) {
            alertDoYouWantToExitTheApp();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Form(
                key: loginController.formState,
                child: Column(
                  children: [
                    const AuthLogo(),
                    const SizedBox(height: 30),
                    const CustomAuthHeaderText(
                        title: "Welcome Back",
                        bodyText:
                            "Sign in with your email and password\n or continue with social media."),
                    const SizedBox(height: 80),
                    CustomAuthTextFild(
                      hinText: "Enter your Email",
                      labelText: "Email",
                      icon: Icons.email_outlined,
                      textEditingController: loginController.email,
                      validator: (value) => validateInput(
                          value: value!,
                          type: InputTypes.email,
                          inputName: 'Username',
                          max: 100,
                          min: 5),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 30),
                    GetBuilder<LoginController>(
                      builder: (loginController) {
                        return CustomAuthTextFild(
                          hinText: "Enter your password",
                          labelText: "Password",
                          icon: loginController.isObsecurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          textEditingController: loginController.password,
                          obsecureText: loginController.isObsecurePassword,
                          onObsecureIconTap: () =>
                              loginController.showPassword(),
                          validator: (value) =>
                              validatePassword(value: value!, max: 30, min: 8),
                          textInputType: TextInputType.text,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const ForgotPassword(),
                    const Spacer(),
                    GetBuilder<LoginController>(
                      builder: (controller) {
                        return CustomAuthButton(
                            buttonText: "Sign in",
                            loading: controller.requestStatus ==
                                    RequestStatus.loading
                                ? customLoadingForm()
                                : null,
                            onPressed: () => loginController.login());
                      },
                    ),
                    const Spacer(flex: 1),
                    QuestionAboutPossesionOfAccountAuth(
                      question: "Dont't have an account?",
                      linkText: "Sign Up",
                      onPressed: () => loginController.goToSignUp(),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends GetView<LoginController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const Text("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () => controller.goToForgotPassword(),
          child: Text(
            "Forgot password",
            style: TextStyle(
                color: AppColors.grey, decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
