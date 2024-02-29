import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/favorites_screen_data.dart';
import 'package:course/data/models/Favorites_model.dart';
import 'package:get/get.dart';

abstract class FavoritesScreenControllerAbs extends GetxController {}

class FavoritesScreenController extends FavoritesScreenControllerAbs {
  Services services = Get.find<Services>();

  RequestStatus requestStatus = RequestStatus.none;
  FavoritesScreenData favoritesScreenData = FavoritesScreenData(Get.find());

  late String token;
  List<FavoritesModel> favorites = [];

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    getallFavoritesProducts();
    super.onInit();
  }

  getallFavoritesProducts() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await favoritesScreenData.allFavoritesProducts(token: token);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['data'].isNotEmpty) {
          requestStatus = RequestStatus.none;
          favorites = (response['data'] as List<dynamic>)
              .map((e) => FavoritesModel.fromJson(e))
              .toList();
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

  deleteFromFavoritesList({required int id}) {
    var response = favoritesScreenData.deleteProductFromFavoritesList(
        token: token, id: id);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        favorites.removeWhere((e) => e.favoriteId == id);
        AppSnackBar.successSnackBar(
            title: "", message: "Product deleted from your favorites");
        update();
      }
    } catch (e) {
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }
}
