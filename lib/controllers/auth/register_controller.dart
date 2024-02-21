import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterControllerAbs extends GetxController {
  register();
  goToLogin();
  goVerifyCodeSignUp();
}

class RegisterController extends RegisterControllerAbs {
  SignupData signupData = SignupData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;

  RequestStatus? requestStatus;

  @override
  register() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await signupData.signup(
          username: username.text,
          email: email.text,
          phone: phone.text,
          password: password.text,
          passwordConfirmation: passwordConfirmation.text);
      requestStatus = handlingResponseData(response);
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == "success") {
          goVerifyCodeSignUp();
        } else if (response['status'] == "error" ||
            response.containsKey('errors') ||
            response.containsKey('message')) {
          AppSnackBar.errorSnackBar(
              title: "Error",
              message: response['message'].split('.').first.trim());
        } else {
          requestStatus = RequestStatus.failure;
        }
        update();
      }
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  goVerifyCodeSignUp() {
    Get.offNamed(AppRoutes.verifyCodeSignUp, arguments: {"email": email.text});
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }
}
