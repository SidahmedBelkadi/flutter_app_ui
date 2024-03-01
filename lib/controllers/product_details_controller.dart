import 'package:course/controllers/carts_controller.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsControllerAbs extends GetxController {}

class ProductDetailsController extends ProductDetailsControllerAbs {
  CartsController cartsController = Get.put(CartsController());

  late ProductModel product;
  int count = 0;

  RequestStatus requestStatus = RequestStatus.none;

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }

  initialData() async {
    requestStatus = RequestStatus.loading;
    update();
    product = Get.arguments['product'];
    count = await cartsController.count(productId: product.id!);
    requestStatus = RequestStatus.none;
    update();
  }

  add() {
    count++;
    update();
    cartsController.add(productId: product.id!);
  }

  remove() {
    if (count > 0) {
      count--;
      update();
      cartsController.remove(productId: product.id!);
    }
  }

  goToCartScreen() {
    Get.offNamed(AppRoutes.cart);
  }

  List productColors = [
    {"id": 1, "name": "Red", "active": 1},
    {"id": 2, "name": "Black", "active": 0},
    {"id": 1, "name": "Blue", "active": 0},
  ];
}
