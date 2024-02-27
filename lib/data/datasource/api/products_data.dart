import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class ProductsData {
  HttpRequest httpRequest;
  ProductsData(this.httpRequest);

  productsData({required String token, String? categoryId}) async {
    Map<String, String>? query =
        categoryId != null ? {"cat": categoryId} : null;
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.allProducts,
        data: {},
        query: query,
        method: 'GET',
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
