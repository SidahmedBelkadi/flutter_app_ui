import 'package:course/core/classes/app_snackbar.dart';
import 'package:course/core/classes/request_status.dart';
import 'package:course/core/functions/handling_response_data.dart';
import 'package:course/data/datasource/api/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late RequestStatus requestStatus;

  fetchData() async {
    requestStatus = RequestStatus.loading;
    var response = await testData.geTestData();
    requestStatus = handlingResponseData(response);
    if (RequestStatus.success == requestStatus) {
      List users = response['data'];
      if (users.isNotEmpty && response['status'] == "success") {
        data.addAll(users);
      } else if (response['status'] == 'error') {
        AppSnackBar.errorSnackBar(title: "Error", message: response['message']);
      } else {
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
