import 'package:course/core/constants/app_colors.dart';
import 'package:course/routes.dart';
import 'package:course/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      routes: routes,
    );
  }
}
