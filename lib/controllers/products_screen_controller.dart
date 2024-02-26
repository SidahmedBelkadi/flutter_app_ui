import 'package:get/get.dart';

abstract class ProductsScreenControllerAbs extends GetxController {
  initialData();
  changeCategory(int index);
}

class ProductsScreenController extends ProductsScreenControllerAbs {
  late List categories;
  late List products;
  late int selectedCategory;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    products = Get.arguments['products'];
    print(products[0]);
    selectedCategory = Get.arguments['selectedCategory'];
  }

  @override
  changeCategory(int index) {
    selectedCategory = index;
    update();
  }
}
