import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class VerifyCodeSignUpData {
  HttpRequest httpRequest;
  VerifyCodeSignUpData(this.httpRequest);

  checkCodeData({
    required String email,
    required String otp,
  }) async {
    var response = await httpRequest.sendRequest(
        method: 'POST',
        endpoint: AppLink.signUpEmailVerification,
        data: {
          "email": email,
          "otp": otp,
        });
    return response.fold((l) => l, (r) => r);
  }
}
