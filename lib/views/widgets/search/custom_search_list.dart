import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/search_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_images.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchedProducts extends GetView<SearchProductsController> {
  const SearchedProducts({super.key, required this.searchedProducts});

  final List<ProductModel> searchedProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: searchedProducts.length,
        itemBuilder: (context, index) {
          ProductModel product = searchedProducts[index];
          return GestureDetector(
            onTap: () => controller.goToProductDetailScreen(product: product),
            child: CustomCardSearchItem(
              name: product.name!,
              image: "${AppLink.staticProductsImages}/${product.image!}",
              price: product.price!,
              discountPrice: product.discountPrice!,
            ),
          );
        });
  }
}

class CustomCardSearchItem extends StatelessWidget {
  const CustomCardSearchItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.discountPrice,
  });

  final String name;
  final String image;
  final double price;
  final double discountPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 14)),
                        price == discountPrice
                            ? Text(
                                "$discountPrice \$",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )
                            : Row(
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        "$price \$",
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          height: 2,
                                          width: 50,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "$discountPrice \$",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          price != discountPrice
              ? Image.asset(
                  AppImage.saleTag,
                  width: 30,
                  height: 30,
                )
              : const Center(),
        ],
      ),
    );
  }
}
