import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  bool _isLoading = false;

  MainProvider() {
    getData();
  }

  bool get isLoading {
    return _isLoading;
  }

  getData() async {
  }
}
