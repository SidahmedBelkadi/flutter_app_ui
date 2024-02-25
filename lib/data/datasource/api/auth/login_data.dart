import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class LoginData {
  HttpRequest httpRequest;
  LoginData(this.httpRequest);

  signup({
    required String email,
    required String password,
  }) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.login,
        data: {
          "email": email,
          "password": password,
        },
        method: 'POST');
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
