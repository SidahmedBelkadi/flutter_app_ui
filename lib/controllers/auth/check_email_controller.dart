import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailControllerAbs extends GetxController {
  checkEmail();
  goToSuccessSignUp();
}

class CheckEmailController extends CheckEmailControllerAbs {
  late TextEditingController email;
  @override
  checkEmail() {
    // TODO: implement checkEmail
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
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
