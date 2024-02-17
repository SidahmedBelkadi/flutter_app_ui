import 'package:course/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImage.authLogo,
      fit: BoxFit.fill,
      height: 100,
      width: 100,
    );
  }
}
