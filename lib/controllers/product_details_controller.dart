import 'package:course/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsControllerAbs extends GetxController {}

class ProductDetailsController extends ProductDetailsControllerAbs {
  late ProductModel product;

  List productColors = [
    {"id": 1, "name": "Red", "active": 1},
    {"id": 2, "name": "Black", "active": 0},
    {"id": 1, "name": "Blue", "active": 0},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    product = Get.arguments['product'];
  }
}
