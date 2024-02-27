import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/products_screen_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/product_model.dart';
import 'package:course/views/widgets/home/custom_app_bar.dart';
import 'package:course/views/widgets/products/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsScreenController());
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
                        return ProductsList(
                          productModel:
                              ProductModel.fromJson(controller.products[index]),
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

class ProductsList extends GetView<ProductsScreenController> {
  final ProductModel productModel;
  const ProductsList({
    super.key,
    required this.productModel,
  });

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
                tag: "${productModel.id}",
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
                  const Icon(Icons.favorite_outline_outlined)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
