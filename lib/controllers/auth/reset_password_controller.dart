import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/auth/reset_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControllerAbs extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordController extends ResetPasswordControllerAbs {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController passwordConfirmation;
  late String email;
  late String otp;

  @override
  void onInit() {
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    email = Get.arguments['email'];
    otp = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }

  RequestStatus? requestStatus;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  resetPassword() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await resetPasswordData.resetPassword(
          email: email, otp: otp, password: password.text);
      requestStatus = handlingResponseData(response);
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == "success") {
          goToSuccessResetPassword();
        } else if (response['status'] == "error" ||
            response.containsKey('errors') ||
            response.containsKey('message')) {
          AppSnackBar.errorSnackBar(
              title: "Error", message: response['message']);
        } else {
          requestStatus = RequestStatus.failure;
        }
        update();
      }
    }
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResePassword);
  }
}
