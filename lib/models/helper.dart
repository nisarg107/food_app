import 'package:mvapp/models/mealmodel.dart';
import 'package:http/http.dart' as http;

class Helper{
  final String name;
  Helper({
    required this.name
  });
  Future<MealModel> getMeal(List meals) async{
    final response=await http.
        get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=${name}"));
        final body=sneakersFromJson(response.body);
        final mealId=body.firstWhere((element) => element.meals==meals);
        return mealId;
  }
}