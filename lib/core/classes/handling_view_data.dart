import 'package:course/core/classes/request_status.dart';
import 'package:course/core/constants/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingViewData extends StatelessWidget {
  final RequestStatus requestStatus;
  final Widget widget;
  const HandlingViewData(
      {super.key, required this.requestStatus, required this.widget});

  @override
  Widget build(BuildContext context) {
    return requestStatus == RequestStatus.loading
        ? Center(
            child:
                LottieBuilder.asset(AppImage.loading, height: 250, width: 250),
          )
        : requestStatus == RequestStatus.offlineFailure
            ? Center(
                child: LottieBuilder.asset(AppImage.offline,
                    height: 250, width: 250),
              )
            : requestStatus == RequestStatus.serverFailure
                ? Center(
                    child: LottieBuilder.asset(AppImage.serverError,
                        height: 250, width: 250),
                  )
                : requestStatus == RequestStatus.failure
                    ? Center(
                        child: LottieBuilder.asset(AppImage.noData,
                            height: 250, width: 250),
                      )
                    : widget;
  }
}
