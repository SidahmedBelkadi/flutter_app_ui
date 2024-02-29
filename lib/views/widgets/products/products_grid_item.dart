import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/favorite_controller.dart';
import 'package:course/controllers/products_screen_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends GetView<ProductsScreenController> {
  const Product({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetailsScreen(product: productModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${productModel.image}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.staticProductsImages}/${productModel.image}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                productModel.name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                productModel.description!,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Rating : "),
                  ...List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productModel.price} \$",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  GetBuilder<FavoritesController>(
                    builder: (controller) => InkWell(
                      onTap: () {
                        if (controller.favorites[productModel.id] == 1) {
                          controller.setFavorite(productModel.id, 0);
                          controller.remove(
                              productId: productModel.id!.toInt());
                        } else {
                          controller.setFavorite(productModel.id, 1);
                          controller.add(productId: productModel.id!.toInt());
                        }
                      },
                      child: Icon(
                        controller.favorites[productModel.id] == 1
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
