import 'package:course/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpControllerAbs extends GetxController {
  goToLogin();
}

class SuccessSignUpController extends SuccessSignUpControllerAbs {
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
