import 'package:course/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale? language;

  Services services = Get.find();

  chnageLanguage(String localeCode) {
    Locale locale = Locale(localeCode);
    services.sharedPreferences.setString("Language", localeCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLanguage =
        services.sharedPreferences.getString("Language");
    if (sharedPrefLanguage == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLanguage == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
