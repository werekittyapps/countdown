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

  String getSolution({@required List<int> numbers, @required List<int> code}) {
    String result = '${numbers[0]}';
    for (int i = 0; i < code.length; i++) {
      switch (code[i]) {
        case 0:
          result = '$result + ${numbers[i + 1]}';
          break;
        case 1:
          if (i == 0) {
            result = '${numbers[i + 1]} - $result';
          } else {
            result = '${numbers[i + 1]} - ($result)';
          }
          break;
        case 2:
          if (i == 0 || code[i - 1] == 2) {
            result = '$result - ${numbers[i + 1]}';
          } else {
            result = '($result) - ${numbers[i + 1]}';
          }
          break;
        case 3:
          if (i == 0 || code[i - 1] == 3) {
            result = '$result * ${numbers[i + 1]}';
          } else {
            result = '($result) * ${numbers[i + 1]}';
          }
          break;
        case 4:
          if (i == 0) {
            result = '${numbers[i + 1]} / $result';
          } else {
            result = '${numbers[i + 1]} / ($result)';
          }
          break;
        case 5:
          if (i == 0) {
            result = '$result / ${numbers[i + 1]}';
          } else {
            result = '($result) / ${numbers[i + 1]}';
          }
          break;
      }
    }
    return result;
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
    int tempTarget = 0;
    int steps = 4 + _random.nextInt(3);
    List<int> tempNumbers = [];
    List<int> solution = [];
    _numbers.forEach((value) {
      tempNumbers.add(value);
    });
    tempNumbers.shuffle();
    while (tempTarget < 100 || tempTarget > 999) {
      solution = [];
      tempTarget = 0;
      for (int i = 0; i < steps; i++) {
        /// + - * / without ()
        if (i == 0) {
          tempTarget = tempNumbers[i];
        } else {
          int mode = 6;
          bool legitSix = false;
          try {
            int u = (tempNumbers[i] / tempTarget) as int;
          } catch (e) {
            legitSix = true;
            mode = 5;
          }
          try {
            int u = (tempTarget / tempNumbers[i]) as int;
            legitSix = false;
          } catch (e) {
            if (legitSix) {
              mode = 4;
            } else {
              mode = 5;
            }
          }
          switch (_random.nextInt(mode)) {
            case 0:
              tempTarget = tempNumbers[i] + tempTarget;
              solution.add(0);
              break;
            case 1:
              tempTarget = tempNumbers[i] - tempTarget;
              solution.add(1);
              break;
            case 2:
              tempTarget = tempTarget - tempNumbers[i];
              solution.add(2);
              break;
            case 3:
              tempTarget = tempNumbers[i] * tempTarget;
              solution.add(3);
              break;
            case 4:
              if (legitSix) {
                tempTarget = (tempTarget / tempNumbers[i]) as int;
                solution.add(5);
              } else {
                tempTarget = (tempNumbers[i] / tempTarget) as int;
                solution.add(4);
              }
              break;
            case 5:
              tempTarget = (tempTarget / tempNumbers[i]) as int;
              solution.add(5);
              break;
          }
        }
      }
      print(tempTarget);
    }
    print(getSolution(numbers: tempNumbers, code: solution));
    _target = tempTarget;
    notifyListeners();
  }

  setLittleOne() async {
    int value = 0;
    while (value < 1) {
      value = _random.nextInt(11);
    }
    _numbers.add(value);
    notifyListeners();
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
