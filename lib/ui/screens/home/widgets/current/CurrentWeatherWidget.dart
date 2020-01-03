import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:forecast_flutter/models/CurrentWeatherModel.dart';
import 'package:forecast_flutter/ui/screens/home/widgets/current/WeatherAssestControler.dart';
import 'package:forecast_flutter/utils/config/Assets.dart';
import 'package:forecast_flutter/utils/config/TextStyles.dart';

class CurrentWeatherWidget extends StatelessWidget {
  CurrentWeatherModel weather;
  String today;
  WeatherAssetsControler _controler;

  CurrentWeatherWidget({@required this.weather, @required this.today}) {
    _controler = WeatherAssetsControler();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildGrayBox(
            child: Center(
                child: Text(
              weather.city.name,
              style: TextStyles.whiteBig,
            )),
            margin: EdgeInsets.only(bottom: 10, top: 10)),
        _buildGrayBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(
                child: Text(
                  today,
                  style: TextStyles.tempMain,
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: 150,
                      height: 150,
                      child: FlareActor(
                        _getWeatherAssetsPath(weather.list[0].weather.first),
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        controller: _controler,
                      )),
                  Column(
                    children: <Widget>[],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGrayBox({Widget child, EdgeInsets margin}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: margin,
        color: Colors.transparent,
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.black38,
              borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
          padding: EdgeInsets.all(5),
          child: child,
        ));
  }

  String _getWeatherAssetsPath(Weather weather) {
    switch (weather.icon) {
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
}
