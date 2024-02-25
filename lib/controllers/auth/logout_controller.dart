import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/auth/logout_data.dart';
import 'package:get/get.dart';

abstract class LogoutControllerAbs extends GetxController {
  logout();
  goToLogin();
  clearToken();
}

class LogoutController extends LogoutControllerAbs {
  Services services = Get.find<Services>();

  LogoutData logoutData = LogoutData(Get.find());
  RequestStatus? requestStatus;

  late String token;

  @override
  logout() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await logoutData.logout(token: token);
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      if (response['status'] == "success") {
        clearToken();
        goToLogin();
      } else if (response['status'] == "error" ||
          response.containsKey('errors') ||
          response.containsKey('message')) {
        AppSnackBar.errorSnackBar(
            title: "Error",
            message: response['message'].split('.').first.trim());
      } else {
        requestStatus = RequestStatus.failure;
      }
      update();
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  clearToken() {
    services.sharedPreferences.setString("user_token", "");
  }

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    super.onInit();
  }
}
