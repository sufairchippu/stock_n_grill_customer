import 'package:flutter/material.dart';

class SplashScController extends ChangeNotifier {
  bool isexpanded = true;

  Future<void> changeSize() async {
    isexpanded = !isexpanded;
    notifyListeners();
  }
}
