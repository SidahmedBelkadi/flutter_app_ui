import 'package:course/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpControllerAbs extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpController extends VerifyCodeSignUpControllerAbs {
  late String verifyCode;

  @override
  checkCode() {
    // TODO: implement checkCode
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }
}
