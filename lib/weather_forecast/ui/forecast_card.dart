import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/weather_forecast/model/weather_forecast_model.dart';
import 'package:hello_world/weather_forecast/util/convert_icon.dart';
import 'package:hello_world/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForeCastModel> snapshot, int index){
  var foreCastList = snapshot.data.daily;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(foreCastList[index].dt*1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: foreCastList[index].weather[0].main,
            color: Colors.pinkAccent, size: 45),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${foreCastList[index].temp.min.toStringAsFixed(0)} °F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white, size: 17,)

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${foreCastList[index].temp.max.toStringAsFixed(0)} °F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white, size: 17,)

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Hum:${foreCastList[index].humidity.toStringAsFixed(0)} %"),
                  ),
                  // Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white, size: 17,)

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Wind:${foreCastList[index].windSpeed.toStringAsFixed(1)} mi/h"),
                  ),
                  // Icon(FontAwesomeIcons.wind , color: Colors.white, size: 17,)

                ],
              )
            ],
          )
        ],
      ),
    ],
  );
}