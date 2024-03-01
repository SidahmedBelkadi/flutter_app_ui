import 'package:course/controllers/product_details_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/data/models/product_model.dart';
import 'package:course/views/widgets/product_details/custom_title.dart';
import 'package:course/views/widgets/product_details/product_image_presentation.dart';
import 'package:course/views/widgets/product_details/quantity_and_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController productDetailsController =
        Get.put(ProductDetailsController());
    ProductModel product = productDetailsController.product;
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) => HandlingViewData(
          requestStatus: controller.requestStatus,
          widget: SizedBox(
            height: Get.height,
            width: double.infinity,
            child: Column(
              children: [
                ProductDetailsScreenImagePresentation(product: product),
                const SizedBox(height: 130),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailsScreenTitle(title: product.name!),
                      const SizedBox(height: 20),
                      PriceAndQuantitySelection(
                        product: product,
                        onAddQuantityPressed: () =>
                            productDetailsController.add(),
                        onRemoveQuantityPressed: () =>
                            productDetailsController.remove(),
                        count: controller.count,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        product.description!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 30),
                      // const ProductDetailsScreenTitle(title: "Color"),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const ProductColorsList(),
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: AddToCartButton(),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddToCartButton extends GetView<ProductDetailsController> {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => controller.goToCartScreen(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColors.secondaryColor,
      child: const Text(
        "Go to cart",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
