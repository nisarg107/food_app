class WeatherModel {
  // ignore: prefer_typing_uninitialized_variables
  var cityname;
  var region;
  var country;
  var temp;
  var time;

  WeatherModel(
      {required this.cityname,
      required this.region,
      required this.country,
      required this.temp,
      required this.time});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cityname = json['location']['name'];
    region = json['location']['region'];
    country = json['location']['country'];
    temp = json['current']['temp_c'];
    time = json['current']['last_updated'];
  }
}
