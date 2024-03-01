import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class CartsData {
  HttpRequest httpRequest;
  CartsData(this.httpRequest);

  allCartProducts({required String token}) async {
    var response = await httpRequest.sendRequest(
      endpoint: AppLink.getAllCartProducts,
      data: {},
      method: 'GET',
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  addProductToCarts({required String token, required int productId}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.addProductToCart,
        data: {'product_id': productId},
        method: 'POST',
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  removeProductFromCarts(
      {required String token, required int productId}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.removeProductFromCart,
        data: {'product_id': productId},
        method: 'POST',
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  getProductQuantityCount(
      {required String token, required int productId}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.getProductQuantityCount,
        data: {'product_id': productId},
        method: 'POST',
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
