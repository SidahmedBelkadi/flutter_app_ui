import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/controllers/carts_controller.dart';
import 'package:course/core/classes/handling_view_data.dart';
import 'package:course/core/constants/app_colors.dart';
import 'package:course/core/constants/app_images.dart';
import 'package:course/core/constants/app_link.dart';
import 'package:course/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartsController());
    return Scaffold(
        appBar: buildAppBar(context),
        bottomNavigationBar: GetBuilder<CartsController>(
          builder: (controller) => HandlingViewData(
            widget: CustomBottomNavigationInvoice(
              price: "${controller.totalPrice}",
              shipping: "100",
              totTalPrice: "${controller.totalPrice + 100}",
            ),
            requestStatus: controller.requestStatus,
          ),
        ),
        body: GetBuilder<CartsController>(
          builder: (controller) => HandlingViewData(
            requestStatus: controller.requestStatus,
            widget: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  buildCustomProductsCounter(count: controller.totalCartCount),
                  const SizedBox(height: 10),
                  ...List.generate(
                    controller.cart.length,
                    (index) {
                      return CustomCardItem(
                        name: controller.cart[index].productName!,
                        price: "${controller.cart[index].productPrice!}",
                        discountPrice:
                            "${controller.cart[index].productDicountPrice!}",
                        count: "${controller.cart[index].productCount!}",
                        image:
                            "${AppLink.staticProductsImages}/${controller.cart[index].productImage}",
                        onAddProductToCartPressed: () => controller.add(
                            productId: controller.cart[index].productId!),
                        onRemoveProductToCartPressed: () => controller.remove(
                            productId: controller.cart[index].productId!),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Container buildCustomProductsCounter({required int count}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        "You have added ($count) items to the cart.",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        "My Cart",
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColors.grey),
      ),
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
    );
  }
}

class CustomBottomNavigationInvoice extends GetView<CartsController> {
  const CustomBottomNavigationInvoice({
    super.key,
    required this.price,
    required this.shipping,
    required this.totTalPrice,
  });

  final String price;
  final String shipping;
  final String totTalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("price"),
                Text("$price \$"),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Shipping"),
                Text("$shipping \$"),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Total price",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$totTalPrice \$",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CustomButtonCart(title: "Place order", onPressed: () {}),
        ],
      ),
    );
  }
}

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    required this.onAddProductToCartPressed,
    required this.onRemoveProductToCartPressed,
    required this.discountPrice,
  });

  final String name;
  final String price;
  final String discountPrice;
  final String count;
  final String image;
  final void Function()? onAddProductToCartPressed;
  final void Function()? onRemoveProductToCartPressed;

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
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: onAddProductToCartPressed,
                          child: const Icon(Icons.add, size: 20),
                        ),
                        Text(count, style: const TextStyle(fontSize: 14)),
                        GestureDetector(
                          onTap: onRemoveProductToCartPressed,
                          child: const Icon(Icons.remove, size: 20),
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

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: Get.width,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(20),
        color: AppColors.primaryColor,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
