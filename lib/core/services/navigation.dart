import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> globalScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void pushService(Widget screen) {
    globalNavigatorKey.currentState?.push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  void popService() {
    globalNavigatorKey.currentState?.pop();
  }

  void popUntilService() {
    globalNavigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  void loaderService(Widget loader) {
    globalNavigatorKey.currentState?.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => loader,
      ),
    );
  }

  void pushAndRemoveUntilService(Widget route) {
    globalNavigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => route,
        ),
        (Route<dynamic> route) => false);
  }

  void pushReplacementService(Widget route) {
    globalNavigatorKey.currentState?.pushReplacement(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => route,
      ),
    );
  }
}
