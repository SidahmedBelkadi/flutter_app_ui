import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/auth/verify_code_sign_up_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpControllerAbs extends GetxController {
  checkCode({required String verificationCode});
  goToSuccessSignUp();
}

class VerifyCodeSignUpController extends VerifyCodeSignUpControllerAbs {
  late String verifyCode;
  late String email;

  RequestStatus? requestStatus;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  @override
  checkCode({required String verificationCode}) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await verifyCodeSignUpData.checkCodeData(
      otp: verificationCode,
      email: email,
    );
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      if (response['status'] == "success") {
        goToSuccessSignUp();
      } else if (response['status'] == "error" ||
          response.containsKey('errors') ||
          response.containsKey('message')) {
        AppSnackBar.errorSnackBar(title: "Error", message: response['message']);
      } else {
        requestStatus = RequestStatus.failure;
      }
      update();
    }
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
