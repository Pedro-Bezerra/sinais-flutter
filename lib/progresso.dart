import 'package:flutter/material.dart';

class ProgressManager extends ChangeNotifier {
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void nextStep() {
    _currentStep++;
    notifyListeners();
  }

  void reset() {
    _currentStep = 0;
    notifyListeners();
  }
}
