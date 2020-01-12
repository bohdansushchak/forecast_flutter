import 'package:forecast_flutter/config/assets.dart';

String getWeatherAssetsPath(String icon) {
  switch (icon) {
    case '01d':
      return Assets.sunnyDay;
      break;
    case '01n':
      return Assets.moonNot;
      break;
    case '02d':
    case '03d':
    case '04d':
      return Assets.cloudyDay;
      break;
    case '02n':
    case '03n':
    case '04n':
      return Assets.cloudyNight;
      break;
    case '09d':
    case '10d':
      return Assets.heavyRainyDay;
      break;
    case '09n':
    case '10n':
      return Assets.heavyRainyNight;
      break;
    case '11d':
      return Assets.thunderRainyDay;
      break;
    case '11n':
      return Assets.thunderRainyNight;
      break;
    case '13d':
    case '13n':
      return Assets.snowy;
      break;
    case '50d':
    case '50n':
      return Assets.foggyWeather;
      break;
  }
}
