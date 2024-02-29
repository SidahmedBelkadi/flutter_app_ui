import 'package:course/controllers/favorite_controller.dart';
import 'package:course/controllers/products_screen_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/data/models/product_model.dart';
import 'package:course/views/widgets/home/custom_app_bar.dart';
import 'package:course/views/widgets/products/categories_list.dart';
import 'package:course/views/widgets/products/products_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsScreenController());
    FavoritesController favoritesController = Get.put(FavoritesController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder<ProductsScreenController>(
            builder: (ProductsScreenController controller) {
              return ListView(
                children: [
                  CustomAppBar(
                    title: "Find Product",
                    onNotificationIconPressed: () {},
                    onSearchIconPressed: () {},
                    disableFavoriteIcon: true,
                  ),
                  const ProductsScreenCategoriesList(),
                  HandlingViewData(
                    requestStatus: controller.requestStatus,
                    widget: GridView.builder(
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        favoritesController
                                .favorites[controller.products[index]['id']] =
                            controller.products[index]['favorite'];
                        return Product(
                          productModel: ProductModel.fromJson(
                            controller.products[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
