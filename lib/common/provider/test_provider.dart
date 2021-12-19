import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProvider with ChangeNotifier{

  String _search;

  TestProvider():_search = '';

  String get search => _search;

  void changeSearch(String value){
     _search = value;
     notifyListeners();
  }
}