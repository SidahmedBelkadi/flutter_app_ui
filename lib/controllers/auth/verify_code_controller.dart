import 'package:course/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeControllerAbs extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeController extends VerifyCodeControllerAbs {
  late String verifyCode;

  @override
  checkCode() {
    // TODO: implement checkCode
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }
}
