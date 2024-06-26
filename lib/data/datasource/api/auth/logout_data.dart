import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class LogoutData {
  HttpRequest httpRequest;
  LogoutData(this.httpRequest);

  logout({required String token}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.logout, data: {}, token: token, method: 'POST');
    print("logoiut ======================= $response");
    return response.fold((l) => l, (r) => r);
  }
}
