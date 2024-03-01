import 'package:course/core/classes/request_status.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/carts_data.dart';
import 'package:course/data/models/cart_model.dart';
import 'package:get/get.dart';

abstract class CartsControllerAbs extends GetxController {
  add({required int productId});
  remove({required int productId});
  count({required int productId});
}

class CartsController extends CartsControllerAbs {
  Services services = Get.find<Services>();
  RequestStatus requestStatus = RequestStatus.none;
  CartsData cartsData = CartsData(Get.find());

  late String token;
  List<CartModel> cart = [];
  double totalPrice = 0.0;
  int totalCartCount = 0;

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    getAllCartProducts();
    super.onInit();
  }

  getAllCartProducts() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await cartsData.allCartProducts(token: token);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['cart'].isNotEmpty) {
          List data = response['cart'];
          totalPrice = response['invoice_price'].toDouble();
          totalCartCount = response['total_cart_count'].toInt();
          cart = data.map((e) => CartModel.fromJson(e)).toList();
          requestStatus = RequestStatus.none;
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
      print("Exception : $e");
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }

  @override
  add({required int productId}) async {
    var response =
        await cartsData.addProductToCarts(token: token, productId: productId);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == 'success') {
          requestStatus = RequestStatus.none;
          resetCart();
          update();
        }
      }
    } catch (e) {
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }

  @override
  remove({required int productId}) async {
    var response = await cartsData.removeProductFromCarts(
        token: token, productId: productId);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == 'success') {
          requestStatus = RequestStatus.none;
          resetCart();
          update();
        }
      }
    } catch (e) {
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }

  @override
  count({required int productId}) async {
    var response = await cartsData.getProductQuantityCount(
        token: token, productId: productId);
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      return response['data']['count'];
    }
  }

  resetCart() {
    totalCartCount = 0;
    totalPrice = 0.0;
    cart.clear();
    getAllCartProducts();
  }
}
