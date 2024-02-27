// import 'package:course/controllers/categories_controller.dart';
// import 'package:course/controllers/products_controller.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/categories_data.dart';
import 'package:course/data/datasource/api/products_data.dart';
import 'package:get/get.dart';

abstract class HomeControllerAbs extends GetxController {
  getData();
  goToProductsScreen({
    required List categories,
    required int selectedCategory,
  });
}

class HomeController extends HomeControllerAbs {
  Services services = Get.find<Services>();
  late String token;

  CategoriesData categoriesData = CategoriesData(Get.find());
  ProductsData productsData = ProductsData(Get.find());

  RequestStatus categroriesRequestStatus = RequestStatus.none;
  RequestStatus productsRequestStatus = RequestStatus.none;
  List categories = [];
  List products = [];

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    getData();
    super.onInit();
  }

  @override
  getData() async {
    categroriesRequestStatus = RequestStatus.loading;
    productsRequestStatus = RequestStatus.loading;
    update();

    // Fetch categories
    var categoriesResult = await getAllCategoriesData();
    // Fetch products
    var productsResult = await getAllProductsData();

    if (categoriesResult is List && productsResult is List) {
      categories.assignAll(categoriesResult);
      products.assignAll(productsResult);
      categroriesRequestStatus = RequestStatus.none;
      productsRequestStatus = RequestStatus.none;
    } else if (categoriesResult is RequestStatus ||
        productsResult is RequestStatus) {
      categroriesRequestStatus = categoriesResult;
      productsRequestStatus = productsResult;
    } else {
      categroriesRequestStatus = RequestStatus.failure;
      productsRequestStatus = RequestStatus.failure;
    }
    update();
  }

  getAllCategoriesData() async {
    RequestStatus requestStatus = RequestStatus.none;
    var response = await categoriesData.categoriesData(token: token);
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      if (response['data'] != null) {
        return response['data'];
      } else if (response['status'] == "error" ||
          response.containsKey('errors') ||
          response.containsKey('message')) {
        return requestStatus = RequestStatus.failure;
      }
    } else {
      return requestStatus = RequestStatus.serverFailure;
    }
  }

  getAllProductsData() async {
    RequestStatus requestStatus = RequestStatus.none;
    var response = await productsData.productsData(token: token);
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      if (response['data'] != null) {
        return response['data'];
      } else if (response['status'] == "error" ||
          response.containsKey('errors') ||
          response.containsKey('message')) {
        return requestStatus = RequestStatus.failure;
      }
    } else {
      return requestStatus = RequestStatus.serverFailure;
    }
  }

  @override
  goToProductsScreen(
      {required List categories, required int selectedCategory}) {
    Get.toNamed(AppRoutes.products, arguments: {
      "categories": categories,
      "selectedCategory": selectedCategory,
    });
  }
}
