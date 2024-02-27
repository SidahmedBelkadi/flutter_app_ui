import 'package:course/controllers/products_screen_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreenCategoriesList extends GetView<ProductsScreenController> {
  const ProductsScreenCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 30),
        itemBuilder: (context, index) {
          return Category(
              categoryModel:
                  CategoryModel.fromJson(controller.categories[index]),
              categoryIndex: index);
        },
      ),
    );
  }
}

class Category extends GetView<ProductsScreenController> {
  final CategoryModel categoryModel;
  final int categoryIndex;
  const Category(
      {super.key, required this.categoryModel, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.changeCategory(categoryIndex, categoryModel.id!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<ProductsScreenController>(
            builder: (controller) => AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                border: Border(
                  bottom: categoryIndex == controller.selectedCategory
                      ? BorderSide(
                          width: 3,
                          color: AppColors.primaryColor,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Text(
                categoryModel.name!,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
