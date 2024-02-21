import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class VerifyCodeData {
  HttpRequest httpRequest;
  VerifyCodeData(this.httpRequest);

  checkCode({
    required String email,
    required String otp,
  }) async {
    var response = await httpRequest.post(endpoint: AppLink.verifyCode, data: {
      "email": email,
      "otp": otp,
    });
    return response.fold((l) => l, (r) => r);
  }
}
