import 'dart:math';
import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _allSet = false;
  int _target = 0;
  int _numberOne = 0;
  int _numberTwo = 0;
  int _numberThree = 0;
  int _numberFour = 0;
  int _numberFive = 0;
  int _numberSix = 0;

  MainProvider() {
    getData();
  }

  bool get isLoading {
    return _isLoading;
  }

  bool get allSet {
    return _allSet;
  }

  int get target {
    return _target;
  }

  int get numberOne {
    return _numberOne;
  }

  int get numberTwo {
    return _numberTwo;
  }

  int get numberThree {
    return _numberThree;
  }

  int get numberFour {
    return _numberFour;
  }

  int get numberFive {
    return _numberFive;
  }

  int get numberSix {
    return _numberSix;
  }

  getData() async {
  }

  refresh() {
    _numberOne = 0;
    _numberTwo = 0;
    _numberThree = 0;
    _numberFour = 0;
    _numberFive = 0;
    _numberSix = 0;
    _allSet = false;

    notifyListeners();
  }

  setTarget() async {
    _target = 0;

    Random random = new Random();
    while (_target < 100) {
      _target = random.nextInt(1000);
      print(_target);
    }
    notifyListeners();
  }

  setLittleOne() async {
    Random random = new Random();

    if (_numberOne == 0) {
      while (_numberOne < 1) {
        _numberOne = random.nextInt(11);
      }
    } else if (_numberTwo == 0) {
      while (_numberTwo < 1) {
        _numberTwo = random.nextInt(11);
      }
    } else if (_numberThree == 0) {
      while (_numberThree < 1) {
        _numberThree = random.nextInt(11);
      }
    } else if (_numberFour == 0) {
      while (_numberFour < 1) {
        _numberFour = random.nextInt(11);
      }
    } else if (_numberFive == 0) {
      while (_numberFive < 1) {
        _numberFive = random.nextInt(11);
      }
    } else if (_numberSix == 0) {
      while (_numberSix < 1) {
        _numberSix = random.nextInt(11);
      }
      _allSet = true;
    }

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
    Random random = new Random();
    int index = 0;
    while (index < 1) {
      index = random.nextInt(5);
    }

    if (_numberOne == 0) {
      _numberOne = witchBigOne(index: index);
    } else if (_numberTwo == 0) {
      _numberTwo = witchBigOne(index: index);
    } else if (_numberThree == 0) {
      _numberThree = witchBigOne(index: index);
    } else if (_numberFour == 0) {
      _numberFour = witchBigOne(index: index);
    } else if (_numberFive == 0) {
      _numberFive = witchBigOne(index: index);
    } else if (_numberSix == 0) {
      _numberSix = witchBigOne(index: index);
      _allSet = true;
    }

    notifyListeners();
  }
}
