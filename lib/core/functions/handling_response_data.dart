import 'package:course/core/classes/request_status.dart';

handlingResponseData(response) {
  if (response is RequestStatus) {
    return response;
  } else {
    return RequestStatus.success;
  }
}
