import 'package:flutter/material.dart';
import 'package:hello_world/flutter_maps/quakes_maps_app/quakes_app.dart';
import 'package:hello_world/parsing_json/json_parsing.dart';
import 'package:hello_world/weather_forecast/weather_forecast.dart';

import 'flutter_maps/simple_google_map/show_map.dart';
import 'parsing_json/json_parsing_map.dart';
import 'ui/Home.dart';

// void main() => runApp(ScaffoldExample());

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14
    ),
    button: base.button.copyWith(
      // fontSize: 23.9,
      // backgroundColor: Colors.red
    ),
    bodyText2: base.bodyText2.copyWith(
      fontSize: 16.9,
      fontFamily: "Lobster",
      color: Colors.white
    )
  ).apply(
    fontFamily: "Lobster",
    displayColor: Colors.amber
  );
}

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
      // theme: _appTheme,
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.grey[800],
      //   textTheme: TextTheme(
      //     headline5: TextStyle(
      //       fontSize: 34,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     bodyText2: TextStyle(
      //       fontSize: 16.9,
      //       color: Colors.white
      //     )
      //   )
      // ),
      home: QuakesApp(),
    ));
