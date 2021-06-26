import 'dart:convert';

import 'package:hello_world/flutter_maps/quakes_maps_app/model/quake.dart';
import 'package:http/http.dart';

class Network {
  Future<Quake> getAllQuakes() async {
    var apiUrl = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";

    final response = await get(Uri.encodeFull(apiUrl));

    if (response.statusCode == 200) {
      print("Quake data: ${response.body}");

      return Quake.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting quakes");
    }
  }
}