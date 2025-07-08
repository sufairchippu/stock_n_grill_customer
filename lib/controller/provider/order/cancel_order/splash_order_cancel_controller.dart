import 'package:flutter/material.dart';

class SplashOrderCancelController extends ChangeNotifier {
  SplashOrderCancelController() {
    changeSize();
  }
  bool isexpanded = true;

  Future<void> changeSize() async {
    isexpanded = !isexpanded;
    notifyListeners();
  }
}
