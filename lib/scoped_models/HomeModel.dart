import 'package:forecast_flutter/app/ServiceLocator.dart';
import 'package:forecast_flutter/enums/ViewState.dart';
import 'package:forecast_flutter/models/CurrentWeatherModel.dart';
import 'package:forecast_flutter/services/WeatherService.dart';
import 'package:intl/intl.dart';

import 'BaseModel.dart';

class HomeModel extends BaseModel {
  final WeatherService _weatherService = locator<WeatherService>();

  CurrentWeatherModel currentWeather;

  String today = DateFormat('EEEE').format(DateTime.now());

  Future<CurrentWeatherModel> updateCurrentWeather() async {
    setState(ViewState.Busy);
    currentWeather = await _weatherService.getCurrentWeatherByCity('London');
    setState(ViewState.Retrived);
  }
}
