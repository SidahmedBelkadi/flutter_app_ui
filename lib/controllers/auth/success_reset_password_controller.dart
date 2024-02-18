import 'package:course/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordControllerAbs extends GetxController {
  goToLogin();
}

class SuccessResetPasswordController extends SuccessResetPasswordControllerAbs {
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
