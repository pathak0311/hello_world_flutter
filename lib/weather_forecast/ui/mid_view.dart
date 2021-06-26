import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/weather_forecast/model/weather_forecast_model.dart';
import 'package:hello_world/weather_forecast/util/convert_icon.dart';
import 'package:hello_world/weather_forecast/util/forecast_util.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForeCastModel> snapshot;
  final String cityName;
  const MidView({Key key, this.snapshot, this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.daily;

    var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);

    var foreCast = forecastList[0];
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cityName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87
              ),),
            Text("${Util.getFormattedDate(formattedDate)}", style: TextStyle(
              fontSize: 15,
            ),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: foreCast.weather[0].main, color: Colors.pinkAccent, size: 198),
            ),
            // Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),
            // Icon(Icons.wb_sunny, size: 195,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${foreCast.temp.day.toStringAsFixed(0)} °F",
                    style: TextStyle(
                        fontSize: 34
                    ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${foreCast.weather[0].description.toUpperCase()}"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${foreCast.windSpeed.toStringAsFixed(1)} mi/h"),
                        Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${foreCast.humidity.toStringAsFixed(0)} %"),
                        Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecastList[0].temp.max.toStringAsFixed(0)} °F"),
                        // Icon(Icons.wb_sunny, size: 20, color: Colors.brown,)
                        Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}


Widget midView(AsyncSnapshot<WeatherForeCastModel> snapshot, String cityName){
  var forecastList = snapshot.data.daily;

  var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);

  var foreCast = forecastList[0];

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(cityName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87
          ),),
          Text("${Util.getFormattedDate(formattedDate)}", style: TextStyle(
            fontSize: 15,
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: foreCast.weather[0].main, color: Colors.pinkAccent, size: 198),
          ),
          // Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),
          // Icon(Icons.wb_sunny, size: 195,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${foreCast.temp.day.toStringAsFixed(0)} °F",
                style: TextStyle(
                  fontSize: 34
                ),),
                Text("${foreCast.weather[0].description.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${foreCast.windSpeed.toStringAsFixed(1)} mi/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${foreCast.humidity.toStringAsFixed(0)} %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].temp.max.toStringAsFixed(0)} °F"),
                      // Icon(Icons.wb_sunny, size: 20, color: Colors.brown,)
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return midView;

}