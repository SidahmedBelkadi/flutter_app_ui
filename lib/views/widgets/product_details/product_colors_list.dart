import 'package:course/controllers/product_details_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColorsList extends GetView<ProductDetailsController> {
  const ProductColorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        controller.productColors.length,
        (index) => Container(
          height: 60,
          width: 90,
          margin: const EdgeInsets.only(right: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            color: controller.productColors[index]['active'] == 0
                ? Colors.white
                : AppColors.secondaryColor,
          ),
          child: Text(
            controller.productColors[index]['name'],
            style: TextStyle(
              color: controller.productColors[index]['active'] == 0
                  ? AppColors.secondaryColor
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
