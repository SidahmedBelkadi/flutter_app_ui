import 'package:course/controllers/auth/token_controller.dart';
import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbs extends GetxController {
  login();
  goToSignUp();
  goToHomePage();
  goToForgotPassword();
}

class LoginController extends LoginControllerAbs {
  LoginData loginData = LoginData(Get.find());
  RequestStatus? requestStatus;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isObsecurePassword = true;

  showPassword() {
    isObsecurePassword = !isObsecurePassword;
    update();
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await loginData.signup(
        email: email.text,
        password: password.text,
      );
      requestStatus = handlingResponseData(response);
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == "success") {
          String token = response['data']['token']['plainTextToken'];
          print("======================= $token");
          TokenController tokenController = Get.find<TokenController>();
          tokenController.setToken(token);
          goToHomePage();
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
  goToSignUp() {
    Get.offNamed(AppRoutes.register);
  }

  @override
  goToHomePage() {
    Get.offNamed(AppRoutes.home);
  }

  @override
  goToForgotPassword() {
    Get.offNamed(AppRoutes.forgotPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
