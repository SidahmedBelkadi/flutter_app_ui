import 'package:course/controllers/favorites_screen_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/favorites/custom_favorites_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesScreenController());
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              GetBuilder<FavoritesScreenController>(
                builder: (controller) => HandlingViewData(
                  requestStatus: controller.requestStatus,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemCount: controller.favorites.length,
                    itemBuilder: (context, index) => CustomFavoriteGridItem(
                        favorite: controller.favorites[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        "My favorites products",
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColors.grey),
      ),
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
    );
  }
}
