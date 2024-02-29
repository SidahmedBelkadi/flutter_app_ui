import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/products_data.dart';
import 'package:course/data/models/product_model.dart';
import 'package:get/get.dart';

abstract class ProductsScreenControllerAbs extends GetxController {
  initialData();
  getAllProductsData(String categoryId);
  changeCategory(int index, int categoryId);
  goToProductDetailsScreen({required ProductModel product});
  goToFavoritesSreen();
}

class ProductsScreenController extends ProductsScreenControllerAbs {
  Services services = Get.find<Services>();
  late String token;

  RequestStatus requestStatus = RequestStatus.none;
  ProductsData productsData = ProductsData(Get.find());

  List categories = [];
  List products = [];
  late int selectedCategory;

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedCategory'];
    await getAllProductsData((selectedCategory + 1).toString());
  }

  @override
  getAllProductsData(String categoryId) async {
    requestStatus = RequestStatus.loading;
    update();
    var response =
        await productsData.productsData(token: token, categoryId: categoryId);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['data'].isNotEmpty) {
          requestStatus = RequestStatus.none;
          products.assignAll(response['data']);
        } else if (response['data'].isEmpty) {
          requestStatus = RequestStatus.failure;
        } else if (response['status'] == "error" ||
            response.containsKey('errors') ||
            response.containsKey('message')) {
          requestStatus = RequestStatus.failure;
        }
        update();
      }
    } catch (e) {
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }

  @override
  changeCategory(int index, int categoryId) async {
    selectedCategory = index;
    update();
    getAllProductsData(categoryId.toString());
    update();
  }

  @override
  goToProductDetailsScreen({required ProductModel product}) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"product": product});
  }

  @override
  goToFavoritesSreen() {
    Get.toNamed(AppRoutes.favoritesProducts);
  }
}
