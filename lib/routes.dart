import 'package:course/core/constants/app_routes.dart';
import 'package:course/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => const LoginScreen()
};
