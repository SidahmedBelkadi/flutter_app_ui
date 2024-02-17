import 'package:course/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterControllerAbs extends GetxController {
  register();
  goToLogin();
}

class RegisterController extends RegisterControllerAbs {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  register() {}

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
