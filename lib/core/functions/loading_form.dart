import 'package:course/core/constants/app_images.dart';
import 'package:lottie/lottie.dart';

customLoadingForm() {
  return LottieBuilder.asset(
    AppImage.formLoading,
    height: 30,
    width: 40,
  );
}
