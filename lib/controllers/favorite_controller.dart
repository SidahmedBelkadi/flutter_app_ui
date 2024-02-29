import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/core/services/services.dart';
import 'package:course/data/datasource/api/favorites_data.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  Map favorites = {};

  setFavorite(id, val) {
    favorites[id] = val;
    update();
  }

  Services services = Get.find<Services>();

  RequestStatus requestStatus = RequestStatus.none;
  FavoritesData favoritesData = FavoritesData(Get.find());

  late String token;

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    super.onInit();
  }

  add({required int productId}) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await favoritesData.addProductToFavorites(
        token: token, productId: productId);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == 'success') {
          requestStatus = RequestStatus.none;
          AppSnackBar.successSnackBar(
              title: "", message: "Product added to your favorites");
        } else {
          requestStatus = RequestStatus.failure;
        }
        update();
      }
    } catch (e) {
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }

  remove({required int productId}) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await favoritesData.removeProductFRomFavorites(
        token: token, productId: productId);
    requestStatus = handlingResponseData(response);
    try {
      if (RequestStatus.success == requestStatus) {
        if (response['status'] == 'success') {
          requestStatus = RequestStatus.none;
          AppSnackBar.successSnackBar(
              title: "", message: "Product removed from your favorites");
        } else {
          requestStatus = RequestStatus.failure;
        }
        update();
      }
    } catch (e) {
      requestStatus = RequestStatus.serverFailure;
      update();
    }
  }
}
