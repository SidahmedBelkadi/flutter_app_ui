import 'package:course/core/constants/app_images.dart';
import 'package:course/data/models/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Choose Product",
      body:
          "We Have a 100k Products. Choose\n Your porduct from our E-\n commerce shop.",
      image: AppImage.onBoardingImageOne),
  OnBoardingModel(
      title: "Easy & Safe Payment",
      body:
          "Easy Checkout & Safe Payment\n methode. Trusted by our Customers\n from all over the world.",
      image: AppImage.onBoardingImageTwo),
  OnBoardingModel(
      title: "Track Your Order",
      body:
          "Best Tracker has been Used For\n Track your order. You'll know where\n your product is at the moment.",
      image: AppImage.onBoardingImageThree),
  OnBoardingModel(
      title: "Fast Delivery",
      body:
          "Reliable And Fast Delivery. We\n Deliver your products the fastest\n way possible.",
      image: AppImage.onBoardingImageFour)
];
