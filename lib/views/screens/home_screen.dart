import 'package:course/controllers/auth/logout_controller.dart';
import 'package:course/controllers/auth/token_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TokenController tokenController = Get.find<TokenController>();
    LogoutController logoutController = Get.put(LogoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home ",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
        actions: [
          IconButton(
              onPressed: () => logoutController.logout(),
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Text("Token = \n ${tokenController.token}"),
      ),
    );
  }
}
