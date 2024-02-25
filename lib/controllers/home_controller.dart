import 'package:course/controllers/categories_controller.dart';
import 'package:course/controllers/products_controller.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:get/get.dart';

abstract class HomeControllerAbs extends GetxController {
  getData();
}

class HomeController extends HomeControllerAbs {
  CategoriesController categoriesController = Get.put(CategoriesController());
  ProductsController productsController = Get.put(ProductsController());

  RequestStatus categroriesRequestStatus = RequestStatus.none;
  RequestStatus productsRequestStatus = RequestStatus.none;
  List categories = [];
  List products = [];

  @override
  getData() async {
    categroriesRequestStatus = RequestStatus.loading;
    productsRequestStatus = RequestStatus.loading;
    update();

    // Fetch categories
    var categoriesResult = await categoriesController.getAllCategoriesData();
    // Fetch products
    var productsResult = await productsController.getAllProductsData();
    if (categoriesResult is List && productsResult is List) {
      categories.assignAll(categoriesResult);
      products.assignAll(productsResult);
      categroriesRequestStatus = RequestStatus.none;
      productsRequestStatus = RequestStatus.none;
    } else {
      categroriesRequestStatus = categoriesResult;
      productsRequestStatus = productsResult;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
