import 'package:course/controllers/home_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/views/widgets/home/categories_list.dart';
import 'package:course/views/widgets/home/custom_app_bar.dart';
import 'package:course/views/widgets/home/custom_header_card.dart';
import 'package:course/views/widgets/home/custom_list_title.dart';
import 'package:course/views/widgets/home/products_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Container(
        color: AppColors.backgroundcolor2,
        height: Get.height,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              title: "Find Product",
              onNotificationIconPressed: () {},
              onSearchIconPressed: () {},
              onFavoritesIconPressed: () => homeController.goToFavoritesSreen(),
            ),
            const SizedBox(height: 20),
            const CustomHeaderCard(
                title: "A summer suprise", body: "Cashback 29%"),
            const SizedBox(height: 30),
            const CustomListTitle(
              title: "Categories",
            ),
            const SizedBox(height: 10),
            GetBuilder<HomeController>(
              builder: (controller) => HandlingViewData(
                requestStatus: controller.categroriesRequestStatus,
                widget: const CategoriesList(),
              ),
            ),
            const SizedBox(height: 30),
            const CustomListTitle(title: "Products for you"),
            const SizedBox(height: 10),
            GetBuilder<HomeController>(
              builder: (controller) => HandlingViewData(
                requestStatus: controller.productsRequestStatus,
                widget: const ProductsList(),
              ),
            ),
            const SizedBox(height: 30),
            const CustomListTitle(title: "Offers for you"),
            const SizedBox(height: 10),
            GetBuilder<HomeController>(
              builder: (controller) => HandlingViewData(
                requestStatus: controller.productsRequestStatus,
                widget: const ProductsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
