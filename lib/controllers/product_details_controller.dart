import 'package:course/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsControllerAbs extends GetxController {}

class ProductDetailsController extends ProductDetailsControllerAbs {
  late ProductModel product;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    product = Get.arguments['product'];
  }
}
