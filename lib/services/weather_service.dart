import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/services/weather_api_provider.dart';

import 'storage_provider.dart';

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
