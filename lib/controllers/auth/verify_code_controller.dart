import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/auth/verify_code_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeControllerAbs extends GetxController {
  checkCode({required String verificationCode});
  goToResetPassword();
}

class VerifyCodeController extends VerifyCodeControllerAbs {
  late String email;
  late String otp;
  RequestStatus? requestStatus;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  @override
  checkCode({required String verificationCode}) async {
    otp = verificationCode;
    requestStatus = RequestStatus.loading;
    update();
    var response = await verifyCodeData.checkCode(
      email: email,
      otp: verificationCode,
    );
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      if (response['status'] == "success") {
        goToResetPassword();
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
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword,
        arguments: {"email": email, "otp": otp});
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
