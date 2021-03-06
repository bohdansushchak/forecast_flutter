import 'package:forecast_flutter/app/service_locator.dart';
import 'package:forecast_flutter/utils/view_state.dart';
import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/services/weather_service.dart';
import 'package:intl/intl.dart';

import 'base_model.dart';

class WeatherAppModel extends BaseModel {
  final WeatherService _weatherService = locator<WeatherService>();

  CurrentWeatherModel currentWeather;

  String today = DateFormat('EEEE').format(DateTime.now());

  Future<CurrentWeatherModel> updateCurrentWeather() async {
    setState(ViewState.Busy);
    currentWeather = await _weatherService.getCurrentWeatherByCity('London');
    setState(ViewState.Retrived);
  }
}
