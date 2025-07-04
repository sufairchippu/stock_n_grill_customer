import 'package:flutter/material.dart';

class MyOrderController extends ChangeNotifier {
  int selctedStatus = 0;

  void changeStatus(int status) {
    selctedStatus = status;
    notifyListeners();
  }
}
