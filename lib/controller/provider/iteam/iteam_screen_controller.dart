import 'package:flutter/material.dart';

class IteamScreenController extends ChangeNotifier {
  int count = 1;
  void incremntCount() {
    ++count;
    notifyListeners();
  }

  void decremntCount() {
    --count;
    notifyListeners();
  }
  
}
