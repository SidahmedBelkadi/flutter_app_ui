import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class FavoritesData {
  HttpRequest httpRequest;
  FavoritesData(this.httpRequest);

  addProductToFavorites({required String token, required int productId}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.addProductToFavorites,
        data: {'product_id': productId},
        method: 'POST',
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  removeProductFRomFavorites(
      {required String token, required int productId}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.removeProductFromFavorites,
        data: {'product_id': productId},
        method: 'POST',
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
