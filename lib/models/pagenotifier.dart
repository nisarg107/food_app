import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  int _activepage = 0;


  int get activepage => _activepage;

  set activePage(int index) {
    _activepage = index;
    notifyListeners();
  }

}