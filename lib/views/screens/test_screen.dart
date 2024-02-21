import 'package:course/controllers/test_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test screen here"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingViewData(
            requestStatus: controller.requestStatus,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text("${controller.data[index]}"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
