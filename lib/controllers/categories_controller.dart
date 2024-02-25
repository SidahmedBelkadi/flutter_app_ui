import 'package:course/core/classes/request_status.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/categories_data.dart';
import 'package:get/get.dart';
import 'package:course/core/services/services.dart';

abstract class CategoriesControllerAbs extends GetxController {
  getAllCategoriesData();
}

class CategoriesController extends CategoriesControllerAbs {
  Services services = Get.find<Services>();
  late String token;

  @override
  void onInit() {
    token = services.sharedPreferences.getString("user_token")!;
    super.onInit();
  }

  RequestStatus requestStatus = RequestStatus.none;
  CategoriesData categoriesData = CategoriesData(Get.find());

  @override
  getAllCategoriesData() async {
    var response = await categoriesData.categoriesData(token: token);
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      if (response['data'] != null) {
        return response['data'];
      } else if (response['status'] == "error" ||
          response.containsKey('errors') ||
          response.containsKey('message')) {
        return requestStatus = RequestStatus.failure;
      }
    } else {
      return requestStatus = RequestStatus.serverFailure;
    }
  }
}
