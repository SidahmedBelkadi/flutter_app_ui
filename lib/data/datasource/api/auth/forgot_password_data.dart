import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class ForgotPasswordData {
  HttpRequest httpRequest;
  ForgotPasswordData(this.httpRequest);

  forgotPassword({required String email}) async {
    var response = await httpRequest
        .post(endpoint: AppLink.forgotPassword, data: {"email": email});
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
