import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: "Poppins",
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
);

ThemeData arabicTheme = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
);
