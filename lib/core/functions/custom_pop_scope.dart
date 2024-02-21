import 'package:course/core/functions/alert_exit_app.dart';
import 'package:flutter/material.dart';

customPopScope({required Widget child}) {
  return PopScope(
    canPop: false,
    onPopInvoked: (bool didPop) async {
      if (!didPop) {
        alertDoYouWantToExitTheApp();
      }
    },
    child: child,
  );
}
