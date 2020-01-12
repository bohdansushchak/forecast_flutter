import 'package:flutter/material.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';

class WeatherWeek extends StatelessWidget {
  final WeatherAppModel model;

  WeatherWeek({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Weather week"),
      ),
    );
  }
}
