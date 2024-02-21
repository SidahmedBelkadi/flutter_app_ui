import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class TestData {
  HttpRequest httpRequest;
  TestData(this.httpRequest);

  geTestData() async {
    var response = await httpRequest.post(endpoint: AppLink.test, data: {});
    return response.fold((l) => l, (r) => r);
  }
}
