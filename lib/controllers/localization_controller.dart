import 'package:course/core/constants/app_theme.dart';
import 'package:course/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale? language;

  Services services = Get.find();

  ThemeData appTheme = englishTheme;

  chnageLanguage(String localeCode) {
    Locale locale = Locale(localeCode);
    services.sharedPreferences.setString("Language", localeCode);
    appTheme = localeCode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLanguage =
        services.sharedPreferences.getString("Language");
    if (sharedPrefLanguage == "ar") {
      language = const Locale("ar");
      appTheme = arabicTheme;
    } else if (sharedPrefLanguage == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
