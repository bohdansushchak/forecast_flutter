import 'dart:convert';

import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/utils/Errors.dart';
import 'package:http/http.dart' as http;

final baseUrl = "http://api.openweathermap.org/data/2.5";
final appId = "be0e24ada11785059ee8cc10881717ad";

// http://api.openweathermap.org/data/2.5/forecast?q=London&APPID=be0e24ada11785059ee8cc10881717ad

class WeatherApiProvider {
  final http.Client _client;

  WeatherApiProvider() : _client = http.Client();

  Future<CurrentWeatherModel> getCurrentWeatherByCity(String city) async {
    var result = await _client.get("$baseUrl/forecast?q=$city&APPID=$appId");

    if (result.statusCode == 200) {
      var json = jsonDecode(result.body);
      return CurrentWeatherModel.fromJson(json);
    }

    throw HttpError(code: result.statusCode, message: "");
  }
}
