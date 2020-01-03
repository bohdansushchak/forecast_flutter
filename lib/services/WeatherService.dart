import 'package:forecast_flutter/models/CurrentWeatherModel.dart';
import 'package:forecast_flutter/services/WeatherApiProvider.dart';

import 'StorageProvider.dart';

class WeatherService {
  final WeatherApiProvider _apiProvider;
  final StorageProvider _storageProvider;

  WeatherService(
      {WeatherApiProvider apiProvider, StorageProvider storageProvider})
      : _apiProvider = apiProvider ?? WeatherApiProvider(),
        _storageProvider = storageProvider ?? StorageProvider;

  Future<CurrentWeatherModel> getCurrentWeatherByCity(String city) async {
    return _apiProvider.getCurrentWeatherByCity(city);
  }

  Future<CurrentWeatherModel> updateCurrentWeather(String city) async {}

}
