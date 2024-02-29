import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class FavoritesScreenData {
  HttpRequest httpRequest;
  FavoritesScreenData(this.httpRequest);

  allFavoritesProducts({required String token}) async {
    var response = await httpRequest.sendRequest(
      endpoint: AppLink.allFavoritesProducts,
      data: {},
      method: 'GET',
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteProductFromFavoritesList(
      {required String token, required int id}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.deleteProductFRomfavoritesList,
        data: {'id': id},
        method: 'POST',
        token: token);
    return response.fold((l) => l, (r) => r);
  }
}
