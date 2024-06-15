import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvapp/maps/apiservice.dart';


class WeatherData {
  Future<WeatherModel> getdata(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=9bb93e16a4ef44b997c121427232710&q=$latitude,$longitude&aqi=no");
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body.toString());
    return WeatherModel.fromJson(body);
  }
}
