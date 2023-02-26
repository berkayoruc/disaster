import 'package:flutter/material.dart';

class TorchProvider with ChangeNotifier {
  bool _isLightOn = false;

  bool get isLightOn => _isLightOn;

  set isLightOn(bool value) {
    _isLightOn = value;
    notifyListeners();
  }
}
