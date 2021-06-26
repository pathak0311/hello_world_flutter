import 'package:flutter/material.dart';
import 'package:hello_world/weather_forecast/model/CityModel.dart';
import 'package:hello_world/weather_forecast/ui/bottom_view.dart';
import 'package:hello_world/weather_forecast/ui/mid_view.dart';

import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForeCastModel> forecastObject;
  String _cityName = "Bangalore";

  @override
  void initState() {
    super.initState();

    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print(weather.daily[0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForeCastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForeCastModel> snapshot) {
                print(snapshot.data);
                if(snapshot.hasData){
                    return Column(
                      children: [
                        MidView(snapshot: snapshot, cityName: _cityName,),
                        // midView(snapshot, _cityName),
                        // bottomView(snapshot, context),
                        BottomView(snapshot: snapshot,)
                      ],
                    );
                } else if(snapshot.hasError) {
                  print(snapshot.error);
                  return Container(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                } else {
                  return Text('no data');
                }
                // if (snapshot.connectionState == ConnectionState.done) {
                //   if (snapshot.data == null) {
                //     return Text('no data');
                //   } else {
                //     return Column(
                //       children: [
                //         midView(snapshot, _cityName),
                //       ],
                //     );
                //   }
                // } else if (snapshot.connectionState == ConnectionState.waiting) {
                //   return Text('Error'); // error
                // } else {
                //   return CircularProgressIndicator(); // loading
                // }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });

          },
        ),
      ),
    );
  }

  Future<WeatherForeCastModel> getWeather({String cityName}) => new Network().getLatLong(cityName: _cityName);
}
