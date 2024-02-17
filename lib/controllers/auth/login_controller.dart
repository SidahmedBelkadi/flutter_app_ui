import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbs extends GetxController {
  login();
  goToSignUp();
}

class LoginController extends LoginControllerAbs {
  late TextEditingController email;
  late TextEditingController password;

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.register);
  }

  @override
  login() {}

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
