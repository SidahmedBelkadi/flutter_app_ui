import 'package:course/core/classes/http_request.dart';
import 'package:course/core/constants/app_link.dart';

class ForgotPasswordData {
  HttpRequest httpRequest;
  ForgotPasswordData(this.httpRequest);

  forgotPassword({required String email}) async {
    var response = await httpRequest.sendRequest(
        endpoint: AppLink.forgotPassword,
        data: {"email": email},
        method: 'POST');
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
