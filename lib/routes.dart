import 'package:course/core/constants/app_routes.dart';
import 'package:course/views/screens/auth/login_screen.dart';
import 'package:course/views/screens/auth/register_screen.dart';
import 'package:course/views/screens/languages_screen.dart';
import 'package:course/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.languages: (context) => const LanguagesScreen(),
  AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.register: (context) => const RegisterScreen(),
};
