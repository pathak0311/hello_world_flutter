import 'dart:convert';

import 'package:hello_world/weather_forecast/model/CityModel.dart';
import 'package:hello_world/weather_forecast/model/weather_forecast_model.dart';
import 'package:hello_world/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForeCastModel> getLatLong({String cityName}) async{
    var finalUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + cityName + "&APPID=" + Util.appId;

    final response = await get(Uri.encodeFull(finalUrl));

    print("URL: ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){
      return getWeatherForecast(cityModel: CityModel.fromJson(json.decode(response.body)));
    } else {
      throw Exception("Error");
    }
  }

  Future<WeatherForeCastModel> getWeatherForecast({CityModel cityModel}) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/onecall?lat=" + cityModel.coord.lat.toString() + "&lon=" + cityModel.coord.lon.toString() + "&exclude=current,minutely,hourly,alerts&appid=" + Util.appId + "&units=imperial";

    final response = await get(Uri.encodeFull(finalUrl));

    print("URL: ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){
      print("Weather Data : ${response.body}");
      return WeatherForeCastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error");
    }
  }
}