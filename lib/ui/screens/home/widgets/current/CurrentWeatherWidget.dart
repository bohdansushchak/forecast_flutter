import 'package:flutter/material.dart';
import 'package:forecast_flutter/models/CurrentWeatherModel.dart';
import 'package:forecast_flutter/utils/config/TextStyles.dart';

class CurrentWeatherWidget extends StatelessWidget {
  CurrentWeatherModel _weather;
  String _city;

  CurrentWeatherWidget({@required CurrentWeatherModel weather, String city})
      : _weather = weather,
        _city = city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildGrayBox(
            child: Center(child: Text(_city, style: TextStyles.whiteBig,)),
            margin: EdgeInsets.only(bottom: 10, top: 10)),
        _buildGrayBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(
                child: Text(
                  _weather.list[0].main.temp.toString(),
                  style: TextStyles.tempMain,
                ),
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
}
