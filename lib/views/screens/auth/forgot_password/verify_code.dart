import 'package:course/controllers/auth/verify_code_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/auth/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeController verifyCodeController = Get.put(VerifyCodeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP verification",
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
                  title: "OTP Verification",
                  bodyText:
                      "Please enter the code sent to\n sidahmed@gmail.com"),
              const SizedBox(height: 50),
              OtpTextField(
                numberOfFields: 5,
                borderColor: AppColors.primaryColor,
                focusedBorderColor: AppColors.primaryColor,
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(12),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                onSubmit: (String verificationCode) {
                  verifyCodeController.goToResetPassword();
                },
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
