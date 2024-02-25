import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class HomeData {
  HttpRequest httpRequest;
  HomeData(this.httpRequest);

  homeData({required String token}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.allCategories, data: {}, method: 'GET', token: token);
    return response.fold((l) => l, (r) => r);
  }
}
