import 'package:course/core/classes/http_request.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpRequest());
  }
}
