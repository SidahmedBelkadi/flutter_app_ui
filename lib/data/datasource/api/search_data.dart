import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class SearchData {
  HttpRequest httpRequest;
  SearchData(this.httpRequest);

  searchProductsData({required String token, required String query}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.searchProducts,
        data: {},
        query: {'query': query},
        method: 'GET',
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
