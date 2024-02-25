import 'package:course/bindings/initial_bindings.dart';
import 'package:course/controllers/localization_controller.dart';
import 'package:course/core/localization/translation.dart';
import 'package:course/core/services/services.dart';
import 'package:course/routes.dart';
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
      title: 'Flutter ecommerce base course project',
      debugShowCheckedModeBanner: false,
      translations: Transation(),
      locale: localizationController.language,
      theme: localizationController.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
