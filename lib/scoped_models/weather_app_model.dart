import 'package:forecast_flutter/app/service_locator.dart';
import 'package:forecast_flutter/models/settings_model.dart';
import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/screens/home/background_controller.dart';
import 'package:forecast_flutter/services/weather_service.dart';
import 'package:forecast_flutter/utils/enums.dart';
import 'package:forecast_flutter/utils/view_state.dart';
import 'package:intl/intl.dart';

import 'base_model.dart';

class WeatherAppModel extends BaseModel {
  final WeatherService _weatherService = locator<WeatherService>();
  final BackgroundController _backgroundController = BackgroundController();

  CurrentWeatherModel currentWeather;
  SettingsModel _settings = SettingsModel(metricSystem: MetricSystem.celsius, backgroundStyle: BackgroundStyle.island01);
  String today = DateFormat('EEEE').format(DateTime.now());

  Future<CurrentWeatherModel> updateCurrentWeather() async {
    try {
      setState(ViewState.Busy);
      currentWeather = await _weatherService.getCurrentWeatherByCity('London');
      print('updateCurrentWeather');
      setState(ViewState.Retrived);
    } catch (error) {
      setState(ViewState.Error);
    }
  }

  Future<void> initWeather() async {
    await updateCurrentWeather();
  }

  void updateSettings(SettingsModel settings) {
    //setState(ViewState.Busy);
    _settings = _settings.copyWithSettings(settings);
    setState(ViewState.Retrived);
  }

  BackgroundController get backgroundController => _backgroundController;
  SettingsModel get settings => _settings;
}
