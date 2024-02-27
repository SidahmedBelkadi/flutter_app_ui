import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/home_controller.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsList extends GetView<HomeController> {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          return Product(
            productModel: ProductModel.fromJson(controller.products[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }
}

class Product extends StatelessWidget {
  final ProductModel productModel;
  const Product({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.staticProductsImages}/${productModel.image}",
              height: 100,
              width: 150,
            ),
          ),
        ),
        // Positioned(
        //   left: 0,
        //   top: 0,
        //   child: Container(

        //     width: 100,
        //     padding: EdgeInsets.all(8),
        //     child: Text(
        //       productModel.name!,
        //       style: TextStyle(
        //         color: AppColors.secondaryColor,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 14,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
