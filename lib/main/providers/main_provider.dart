import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MainProvider with ChangeNotifier {
  int _target = 0;
  int _testTrigger;
  List<int> _numbers = [];
  Random _random = new Random();

  MainProvider() {
    getData();
  }

  int get target {
    return _target;
  }

  int get testTrigger {
    return _testTrigger;
  }

  List get numbers {
    return [..._numbers];
  }

  Random get random {
    return _random;
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
          /// if (i == 0) {
          if (i == 0 || code[i - 1] == 1 || code[i - 1] == 2) {
            result = '${numbers[i + 1]} - $result';
          } else {
            result = '${numbers[i + 1]} - ($result)';
          }
          break;
        case 2:
          ///if (i == 0 || code[i - 1] == 2) {
          if (i == 0 || code[i - 1] == 1 || code[i - 1] == 2) {
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
    //850
    //flutter: SOLUTION IS VALID: false
    //flutter: (50 - 7 - 1 - 10) * 25
    print('SOLUTION IS VALID: ${isSolutionValid(solution: result.replaceAll(' ', ''))}');
    return result;
  }

  bool isValid({@required int func, @required int res, @required int temp}) {
    bool result = true;
    switch (func) {
      case 1:
        if (temp - res < 0) {
          result = false;
        }
        break;
      case 2:
        if (res - temp < 0) {
          result = false;
        }
        break;
      case 4:
        try {
          _testTrigger = (temp / res) as int;
        } catch (e) {
          result = false;
        }
        break;
      case 5:
        try {
          _testTrigger = (res / temp) as int;
        } catch (e) {
          result = false;
        }
        break;
    }
    return result;
  }

  bool isSolutionValid({@required String solution}) {
    bool result = false;
    Parser p = new Parser();
    Expression exp = p.parse(solution);
    int temp = int.parse(exp.evaluate(EvaluationType.REAL, null).toString().split('.')[0]);
    if (temp == _target) result = true;
    return result;
  }

  refresh() {
    _target = 0;
    _numbers = [];
    notifyListeners();
  }

  setTargetWithSolution2() {
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
        /// + - * /
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

  setTargetWithSolution({@required int steps}) {
    int result = 0;
    List<int> tempNumbers = [];
    List<int> solution = [];

    _numbers.forEach((value) {
      tempNumbers.add(value);
    });
    tempNumbers.shuffle();

    while (result < 100 || result > 999) {
      solution = [];
      result = 0;

      for (int i = 0; i < steps; i++) {
        /// + - * /
        if (i == 0) {
          result = tempNumbers[0];
        } else {
          bool validOne = isValid(func: 1, res: result, temp: tempNumbers[i]);
          bool validTwo = isValid(func: 2, res: result, temp: tempNumbers[i]);
          bool validFour = isValid(func: 4, res: result, temp: tempNumbers[i]);
          bool validFive = isValid(func: 5, res: result, temp: tempNumbers[i]);
          int mode = _random.nextInt(6);

          while ((!validOne && mode == 1) || (!validTwo && mode == 2) || (!validFour && mode == 4) || (!validFive && mode == 5)) {
            mode = _random.nextInt(6);
          }

          switch (mode) {
            case 0:
              result = tempNumbers[i] + result;
              solution.add(0);
              break;
            case 1:
              result = tempNumbers[i] - result;
              solution.add(1);
              break;
            case 2:
              result = result - tempNumbers[i];
              solution.add(2);
              break;
            case 3:
              result = tempNumbers[i] * result;
              solution.add(3);
              break;
            case 4:
              result = (tempNumbers[i] / result) as int;
              solution.add(4);
              break;
            case 5:
              result = (result / tempNumbers[i]) as int;
              solution.add(5);
              break;
          }
        }
      }
      print(result);
    }
    _target = result;
    print(getSolution(numbers: tempNumbers, code: solution));
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
