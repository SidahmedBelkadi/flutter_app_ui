import 'package:course/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

customDefaultAppLoading() {
  return Center(
    child: LottieBuilder.asset(
      AppImage.loading,
      height: 250,
      width: 200,
    ),
  );
}
