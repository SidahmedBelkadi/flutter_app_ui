import 'package:course/core/constants/app_routes.dart';
import 'package:course/views/screens/auth/forgot_password.dart';
import 'package:course/views/screens/auth/login_screen.dart';
import 'package:course/views/screens/auth/register_screen.dart';
import 'package:course/views/screens/auth/reset_password.dart';
import 'package:course/views/screens/auth/success_reset_password.dart';
import 'package:course/views/screens/auth/success_sign_up.dart';
import 'package:course/views/screens/auth/verify_code.dart';
import 'package:course/views/screens/languages_screen.dart';
import 'package:course/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Localization
  AppRoutes.languages: (context) => const LanguagesScreen(),
  // OnBoarding
  AppRoutes.onBoarding: (context) => const OnBoardingScreen(),
  //Authentification
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.register: (context) => const RegisterScreen(),
  AppRoutes.successSignUp: (context) => const SuccessSignUpScreen(),
  AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
  AppRoutes.verifyCode: (context) => const VerifyCodeScreen(),
  AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),
  AppRoutes.successResePassword: (context) =>
      const SuccessResetPasswordScreen(),
};
