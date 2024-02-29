import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreenImagePresentation extends StatelessWidget {
  const ProductDetailsScreenImagePresentation({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: AppColors.secondaryColor,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 50,
          child: Center(
            child: Hero(
              tag: "${product.image}",
              child: CachedNetworkImage(
                imageUrl: "${AppLink.staticProductsImages}/${product.image}",
                height: 300,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
