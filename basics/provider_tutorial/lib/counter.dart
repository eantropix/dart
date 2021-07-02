import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int _counter = 0;

  int get count {
    return _counter;
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
