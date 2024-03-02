import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/search_controller.dart';
import 'package:course/core/constants/app_colors.dart';
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
                price: product.price!),
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
  });

  final String name;
  final String image;
  final double price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
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
                    Text(
                      "$price \$",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
