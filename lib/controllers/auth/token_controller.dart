import 'package:get/get.dart';

class TokenController extends GetxController {
  static TokenController get to => Get.find();

  RxString token = ''.obs;

  void setToken(String newToken) {
    token.value = newToken;
  }

  void clearToken() {
    token.value = '';
  }
}
