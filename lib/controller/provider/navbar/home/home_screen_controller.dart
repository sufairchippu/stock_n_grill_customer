import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  int currentIndex = 0;
  void onCategerieSelection({required int seletedIndex}) {
    currentIndex = seletedIndex;
    notifyListeners();
  }
}
