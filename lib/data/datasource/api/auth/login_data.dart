import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class LoginData {
  HttpRequest httpRequest;
  LoginData(this.httpRequest);

  signup({
    required String email,
    required String password,
  }) async {
    var response = await httpRequest.post(endpoint: AppLink.login, data: {
      "email": email,
      "password": password,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
