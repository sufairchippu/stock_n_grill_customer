import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  int currentIndex = 0;
  bool isCategory = false;
  void onCategerieSelection({required int seletedIndex}) {
    // currentIndex != seletedIndex
    //     ? isCategory = true
    //     : isCategory == false
    //     ? isCategory = true
    //     : isCategory = false;
    // currentIndex = seletedIndex;
    if (currentIndex != seletedIndex) {
      isCategory = true;
      currentIndex = seletedIndex;
    } else {
      isCategory = !isCategory; // toggle if same category selected
    }

    notifyListeners();
  }
}
