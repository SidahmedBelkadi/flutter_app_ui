import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class ResetPasswordData {
  HttpRequest httpRequest;
  ResetPasswordData(this.httpRequest);

  resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    var response =
        await httpRequest.post(endpoint: AppLink.resetpassword, data: {
      "email": email,
      "password": password,
      "otp": otp,
    });
    return response.fold((l) => l, (r) => r);
  }
}
