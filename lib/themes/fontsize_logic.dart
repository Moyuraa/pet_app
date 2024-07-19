import 'package:flutter/material.dart';

class FontSizeLogic extends ChangeNotifier {
  double _size = 0.0;
  double get size => _size;

  void increase() {
    if (_size < 20.0) {
      _size += 1.0;
      notifyListeners();
    }
  }

  void decrease() {
    if (_size > 0.0) {
      _size -= 1.0;
      notifyListeners();
    }
  }
}
