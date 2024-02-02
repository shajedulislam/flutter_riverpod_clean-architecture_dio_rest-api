import 'package:flutter/material.dart';

void callBackFunction(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
