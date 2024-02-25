import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class ProductsData {
  HttpRequest httpRequest;
  ProductsData(this.httpRequest);

  productsData({required String token}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.allProducts, data: {}, method: 'GET', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
