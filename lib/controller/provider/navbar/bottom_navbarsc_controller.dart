import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class BottomNavbarscController extends ChangeNotifier {
  int currentIndex = 0;
  void onScreenChange({required int seletedIndex}) {
    currentIndex = seletedIndex;
    notifyListeners();
  }




  static late Database database;
  
}
