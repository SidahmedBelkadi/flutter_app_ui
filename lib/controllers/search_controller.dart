import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_routes.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/search_data.dart';
import 'package:course/data/models/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SearchControllerAbs extends GetxController {
  onSearch({required String value});
  searchProducts();
  clearSearchField();
  goToProductDetailScreen({required ProductModel product});
}

class SearchProductsController extends SearchControllerAbs {
  Services services = Get.find<Services>();
  late String token;

  RequestStatus searchRequestStatus = RequestStatus.none;
  SearchData searchData = SearchData(Get.find());
  TextEditingController? search;
  bool isTyping = false;
  List<ProductModel> searchedProducts = [];

  @override
  void onInit() {
    search = TextEditingController();
    token = services.sharedPreferences.getString("user_token")!;

    super.onInit();
  }

  @override
  onSearch({required String value}) async {
    isTyping = false;
    searchedProducts.clear();
    update();
    update();
    if (value != "") {
      isTyping = true;
      update();

      searchRequestStatus = RequestStatus.loading;
      update();
      await Future.delayed(const Duration(seconds: 1));
      var response = await searchProducts();
      searchRequestStatus = handlingResponseData(response);
      if (searchRequestStatus == RequestStatus.success) {
        searchRequestStatus = RequestStatus.none;
      } else {
        searchRequestStatus = response;
      }
      update();
    }
  }

  @override
  searchProducts() async {
    var response =
        await searchData.searchProductsData(token: token, query: search!.text);
    try {
      if (response['data'].isNotEmpty) {
        searchedProducts = (response['data'] as List<dynamic>)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return searchRequestStatus = RequestStatus.none;
      } else if (response['data'].isEmpty) {
        return searchRequestStatus = RequestStatus.failure;
      } else if (response['status'] == "error" ||
          response.containsKey('errors') ||
          response.containsKey('message')) {
        return searchRequestStatus = RequestStatus.failure;
      }
    } catch (e) {
      print("Exception : $e");
      searchRequestStatus = RequestStatus.serverFailure;
      update();
    }
  }

  @override
  clearSearchField() {
    isTyping = false;
    search = TextEditingController.fromValue(null);
    searchedProducts.clear();
    update();
    update();
  }

  @override
  goToProductDetailScreen({required ProductModel product}) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"product": product});
  }
}
