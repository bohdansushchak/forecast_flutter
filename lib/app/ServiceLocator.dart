import 'package:forecast_flutter/scoped_models/HomeModel.dart';
import 'package:forecast_flutter/services/StorageProvider.dart';
import 'package:forecast_flutter/services/WeatherApiProvider.dart';
import 'package:forecast_flutter/services/WeatherService.dart';
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
