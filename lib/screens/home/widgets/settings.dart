import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';

class Settings extends StatefulWidget {
  final WeatherAppModel model;

  Settings({@required this.model});

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings"),
    );
  }
}
