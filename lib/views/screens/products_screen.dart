import 'package:course/controllers/favorite_controller.dart';
import 'package:course/controllers/products_screen_controller.dart';
import 'package:course/controllers/search_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/data/models/product_model.dart';
import 'package:course/views/widgets/home/custom_app_bar.dart';
import 'package:course/views/widgets/products/categories_list.dart';
import 'package:course/views/widgets/products/products_grid_item.dart';
import 'package:course/views/widgets/search/custom_search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsScreenController());
    Get.put(SearchProductsController());
    FavoritesController favoritesController = Get.put(FavoritesController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              GetBuilder<SearchProductsController>(builder: (controller) {
                return CustomAppBar(
                  title: "Find Product",
                  searchController: controller.search!,
                  isTyping: controller.isTyping,
                  onSearchChanged: (value) => controller.onSearch(value: value),
                  onClearIconPressed: () => controller.clearSearchField(),
                  disableFavoriteIcon: true,
                  disableNotificationIcon: false,
                );
              }),
              const ProductsScreenCategoriesList(),
              GetBuilder<SearchProductsController>(
                builder: (searchController) => searchController.isTyping != true
                    ? GetBuilder<ProductsScreenController>(
                        builder: (controller) {
                        return HandlingViewData(
                          requestStatus: controller.requestStatus,
                          widget: GridView.builder(
                            itemCount: controller.products.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              favoritesController.favorites[
                                      controller.products[index]['id']] =
                                  controller.products[index]['favorite'];
                              return Product(
                                productModel: ProductModel.fromJson(
                                  controller.products[index],
                                ),
                              );
                            },
                          ),
                        );
                      })
                    : HandlingViewData(
                        requestStatus: searchController.searchRequestStatus,
                        widget: SearchedProducts(
                            searchedProducts:
                                searchController.searchedProducts),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
