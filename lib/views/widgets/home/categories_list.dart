import 'package:course/controllers/home_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesList extends GetView<HomeController> {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
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

class Category extends GetView<HomeController> {
  final CategoryModel categoryModel;
  final int categoryIndex;
  const Category(
      {super.key, required this.categoryModel, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToProductsScreen(
          categories: controller.categories, selectedCategory: categoryIndex),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.network(
              "${AppLink.staticCategoriesImages}/${categoryModel.image}",
              height: 50,
              width: 70,
              fit: BoxFit.fill,
              // ignore: deprecated_member_use
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            categoryModel.name!,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
