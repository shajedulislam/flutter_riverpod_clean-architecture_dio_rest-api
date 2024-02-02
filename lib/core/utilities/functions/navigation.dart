import 'package:flutter/material.dart';

import '../../services/navigation.dart';
import '../singleton.dart';

void push({required Widget screen}) {
  locator<NavigationService>().pushService(screen);
}

void pop() {
  locator<NavigationService>().popService();
}

void popUntilRoot() {
  locator<NavigationService>().popUntilService();
}

void pushReplaced({required Widget screen}) {
  locator<NavigationService>().pushReplacementService(screen);
}

void pushAndRemoveAll({required Widget screen}) {
  locator<NavigationService>().pushAndRemoveUntilService(screen);
}

void loader({required Widget screen}) {
  locator<NavigationService>().loaderService(screen);
}
