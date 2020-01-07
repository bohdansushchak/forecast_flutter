  import 'config/Assets.dart';

String getWeatherAssetsPath(String icon) {
    switch (icon) {
      case '01d':
        return WeatherAssets.SUNNY_DAY;
        break;
      case '01n':
        return WeatherAssets.MOON_NOT;
        break;
      case '02d':
      case '03d':
      case '04d':
        return WeatherAssets.CLOUDY_DAY;
        break;
      case '02n':
      case '03n':
      case '04n':
        return WeatherAssets.CLOUDY_NIGHT;
        break;
      case '09d':
      case '10d':
        return WeatherAssets.HEAVY_RAINY_DAY;
        break;
      case '09n':
      case '10n':
        return WeatherAssets.HEAVY_RAINY_NIGHT;
        break;
      case '11d':
        return WeatherAssets.THUNDER_RAINY_DAY;
        break;
      case '11n':
        return WeatherAssets.THUNDER_RAINY_NIGHT;
        break;
      case '13d':
      case '13n':
        return WeatherAssets.SNOWY;
        break;
      case '50d':
      case '50n':
        return WeatherAssets.FOGGY_WEATHER;
        break;
    }
  }