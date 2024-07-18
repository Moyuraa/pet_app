import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void changeToLightMode() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changeToDarkMode() {
    _themeIndex = 1;
    notifyListeners();
  }
}
