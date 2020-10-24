import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeStateNotifier extends ChangeNotifier{
  bool isDarkModeOn = false;
  void UpdateTheme(bool isDarkModeOn){
    this.isDarkModeOn = isDarkModeOn;
    notifyListeners();
  }
}