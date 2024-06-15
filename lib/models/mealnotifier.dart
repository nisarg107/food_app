import 'package:flutter/material.dart';
import 'package:mvapp/models/mealmodel.dart';

class MealNotifier extends ChangeNotifier{
  int _x=0;
  int get x=>_x;
  String _id="";
  String get id=>_id;
  
  void incrementX(){
    _x++;
    notifyListeners();
  }
  void decrementX(){
    _x--;
    notifyListeners();
  }
  void getId(String iid){
    _id=iid;
    notifyListeners();
  }
}