import 'package:flutter/material.dart';

class SpecsMode extends ChangeNotifier{

  bool _isClassic = true;

  bool get isClassic => _isClassic;

  void changeMode(){
    _isClassic = !_isClassic;

    notifyListeners();
  }
}