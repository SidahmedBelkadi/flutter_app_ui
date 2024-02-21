import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/middlewares/init_middleware.dart';
import 'package:course/views/screens/auth/forgot_password/forgot_password.dart';
import 'package:course/views/screens/auth/login_screen.dart';
import 'package:course/views/screens/auth/register_screen.dart';
import 'package:course/views/screens/auth/forgot_password/reset_password.dart';
import 'package:course/views/screens/auth/forgot_password/success_reset_password.dart';
import 'package:course/views/screens/auth/success_sign_up.dart';
import 'package:course/views/screens/auth/forgot_password/verify_code.dart';
import 'package:course/views/screens/auth/verify_code_sign_up.dart';
import 'package:course/views/screens/home_screen.dart';
import 'package:course/views/screens/languages_screen.dart';
import 'package:course/views/screens/onboarding_screen.dart';
// import 'package:course/views/screens/test_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // Test
  // GetPage(name: "/test", page: () => const TestScreen()),

  // ==============================  Localization ==================== //

  GetPage(
    name: "/",
    page: () => const LanguagesScreen(),
    middlewares: [
      InitMiddleware(),
    ],
  ),
  // ============================== OnBoarding ======================== //

  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
  // ============================= Authentification ================== //
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
  GetPage(
      name: AppRoutes.successSignUp, page: () => const SuccessSignUpScreen()),
  GetPage(
      name: AppRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeScreen()),
  GetPage(
      name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(
      name: AppRoutes.successResePassword,
      page: () => const SuccessResetPasswordScreen()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp,
      page: () => const VerifyCodeSignUpScreen()),

  // =============================== Home ========================= //
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
];
