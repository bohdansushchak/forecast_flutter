import 'package:forecast_flutter/app/service_locator.dart';
import 'package:forecast_flutter/screens/home/background_controller.dart';
import 'package:forecast_flutter/utils/view_state.dart';
import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/services/weather_service.dart';
import 'package:intl/intl.dart';

import 'base_model.dart';

class WeatherAppModel extends BaseModel {
  final WeatherService _weatherService = locator<WeatherService>();
  final BackgroundController _backgroundController = BackgroundController();

  CurrentWeatherModel currentWeather;
  String today = DateFormat('EEEE').format(DateTime.now());

  WeatherAppModel() {
   // initWeather();
  }
  Future<CurrentWeatherModel> updateCurrentWeather() async {
    setState(ViewState.Busy);
    currentWeather = await _weatherService.getCurrentWeatherByCity('London');
    print('updateCurrentWeather');
    setState(ViewState.Retrived);
  }

  Future<void> initWeather() async {
    await updateCurrentWeather();
  }

  BackgroundController get backgroundController => _backgroundController;
}
