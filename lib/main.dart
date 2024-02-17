import 'package:course/controllers/localization_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/localization/translation.dart';
import 'package:course/core/services/services.dart';
import 'package:course/routes.dart';
import 'package:course/views/screens/languages_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // My custom initial services (Getx Services)
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalizationController localizationController =
        Get.put(LocalizationController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: Transation(),
      locale: localizationController.language,
      theme: ThemeData(
        fontFamily: "Poppins",
        textTheme: TextTheme(
          displayLarge:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
            height: 2,
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const LanguagesScreen(),
      routes: routes,
    );
  }
}
