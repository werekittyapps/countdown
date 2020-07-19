import 'dart:math';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  int _target = 0;
  List<int> _numbers = [];
  Random _random = new Random();

  MainProvider() {
    getData();
  }

  int get target {
    return _target;
  }

  List get numbers {
    return [..._numbers];
  }

  getData() async {
  }

  refresh() {
    _target = 0;
    _numbers = [];
    notifyListeners();
  }

  setTarget() async {
    _target = 0;

    while (_target < 100) {
      _target = _random.nextInt(1000);
      print(_target);
    }
    notifyListeners();
  }

  setTargetWithSolution() {

  }

  setLittleOne() async {
    int value = 0;
    while (value < 1) {
      value = _random.nextInt(11);
    }
    _numbers.add(value);
    notifyListeners();
  }

  int witchBigOne({@required int index}) {
    int result = 0;
    switch (index) {
      case 1:
        result = 25;
        break;
      case 2:
        result = 50;
        break;
      case 3:
        result = 75;
        break;
      case 4:
        result = 100;
        break;
    }
    return result;
  }

  setBigOne() async {
    int index = 0;
    while (index < 1) {
      index = _random.nextInt(5);
    }
    _numbers.add(witchBigOne(index: index));
    notifyListeners();
  }
}
