import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreenTitle extends StatelessWidget {
  const ProductDetailsScreenTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
