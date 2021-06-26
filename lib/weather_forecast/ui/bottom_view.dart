import 'package:flutter/material.dart';
import 'package:hello_world/weather_forecast/model/weather_forecast_model.dart';

import 'forecast_card.dart';

class BottomView extends StatelessWidget {

  final AsyncSnapshot<WeatherForeCastModel> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("7-Day Weather Forecast".toUpperCase(),
          style: TextStyle(
              fontSize: 14,
              color: Colors.black87
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: snapshot.data.daily.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/2.4,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xff9661C3), Colors.white],
                        begin: Alignment.topLeft, end: Alignment.bottomRight)
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


Widget bottomView(AsyncSnapshot<WeatherForeCastModel> snapshot, BuildContext context) {
  var foreCastList = snapshot.data.daily;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast".toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87
        ),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: foreCastList.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/2.4,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff9661C3), Colors.white],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)
                ),
              ),
            ),
        ),
      )
    ],
  );
}