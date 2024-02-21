import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/auth/forgot_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordControllerAbs extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgotPasswordController extends ForgotPasswordControllerAbs {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  RequestStatus? requestStatus;
  ForgotPasswordData forgotPasswordData = ForgotPasswordData(Get.find());

  late TextEditingController email;
  @override
  checkEmail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await forgotPasswordData.forgotPassword(email: email.text);
      requestStatus = handlingResponseData(response);
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == "success") {
          goToVerifyCode();
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
  goToVerifyCode() {
    Get.offNamed(AppRoutes.verifyCode, arguments: {'email': email.text});
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
