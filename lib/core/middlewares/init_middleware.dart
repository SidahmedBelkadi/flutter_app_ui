import 'package:course/controllers/onboarding_controller.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InitMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  Services services = Get.find<Services>();

  @override
  RouteSettings? redirect(String? route) {
    if (services.sharedPreferences.getString("user_token") != null) {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (services.sharedPreferences.getBool(OnBoardingController.onBoarding) ==
        true) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
