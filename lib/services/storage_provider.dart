import 'dart:convert';

import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider {
  StorageProvider() {}

  Future<CurrentWeatherModel> currentWeatherFromPrefs(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var txt = prefs.getString(city.toLowerCase());
    var json = jsonDecode(txt);
    return CurrentWeatherModel.fromJson(json);
  }
}
