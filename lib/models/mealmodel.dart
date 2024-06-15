import 'dart:convert';

List<MealModel> sneakersFromJson(String str) =>
    List<MealModel>.from(json.decode(str).map((x) => MealModel.fromJson(x)));

class MealModel{
  List<Meal> ?meals;
  MealModel({
    required this.meals,
  });

  MealModel.fromJson(Map<String,dynamic> json){
    if(json["meals"]!=null){
      meals=<Meal>[];
      (json["meals"] as List).forEach((element) { 
        meals!.add(Meal.fromJson(element));
      });
    }
  }
}
class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });
  factory Meal.fromJson(Map<String,dynamic> json)=>Meal(strMeal: json["strMeal"], strMealThumb: json["strMealThumb"], idMeal: json["idMeal"]);
}
