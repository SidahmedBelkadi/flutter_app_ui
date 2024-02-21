import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class SignupData {
  HttpRequest httpRequest;
  SignupData(this.httpRequest);

  signup({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    var response = await httpRequest.post(endpoint: AppLink.register, data: {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
