import 'package:forecast_flutter/scoped_models/home_model.dart';
import 'package:forecast_flutter/services/storage_provider.dart';
import 'package:forecast_flutter/services/weather_api_provider.dart';
import 'package:forecast_flutter/services/weather_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<WeatherApiProvider>(WeatherApiProvider());
  locator.registerSingleton<StorageProvider>(StorageProvider());

  locator.registerLazySingleton<WeatherService>(() => WeatherService(
      apiProvider: locator<WeatherApiProvider>(),
      storageProvider: locator<StorageProvider>()));

  locator.registerFactory<HomeModel>(() => HomeModel());
}
