import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:forecast_flutter/config/text_styles.dart';
import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:forecast_flutter/screens/home/widgets/weather_assest_controler.dart';
import 'package:forecast_flutter/utils/icons_helper.dart';
import 'package:forecast_flutter/utils/metric_helper.dart';
import 'package:forecast_flutter/widgets/gray_box.dart';
import 'package:intl/intl.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherAppModel model;
  final WeatherAssetsController _controller;

  CurrentWeather({
    @required this.model,
  }) : _controller = WeatherAssetsController();

  @override
  Widget build(BuildContext context) {
    if (model.currentWeather == null) {
      return SizedBox();
    }
    var current = model.currentWeather.list.first;
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GrayBox(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                  child: Text(
                    "${model.today} - ${current.weather.first.main}",
                    style: TextStyles.tempMain,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      child: FlareActor(
                        getWeatherAssetsPath(current.weather.first.icon),
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        controller: _controller,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          current.main.temp.floor().toString() +
                              MetricHelper.getTempMetric(
                                  model.settings.metricSystem),
                          style: TextStyles.currentTempMain,
                        ),
                        Text(
                          current.main.tempMax.floor().toString() +
                              MetricHelper.getTempMetric(
                                  model.settings.metricSystem),
                        ),
                        Text(
                          current.main.tempMin.floor().toString() +
                              MetricHelper.getTempMetric(
                                  model.settings.metricSystem),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          WeatherByHour(list: model.currentWeather.list),
        ],
      ),
    );
  }
}

class WeatherByHour extends StatelessWidget {
  final List<ListWeather> list;

  WeatherByHour({@required List<ListWeather> list})
      : this.list =
            list.length > 5 ? list.getRange(1, 6).toList() : list.toList();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int idx) =>
            WeatherHourItem(weather: list[idx]),
      ),
    );
  }
}

class WeatherHourItem extends StatelessWidget {
  final ListWeather weather;

  WeatherHourItem({@required this.weather});

  @override
  Widget build(BuildContext context) {
    var time = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(weather.dtTxt);
    return GrayBox(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "${time.hour}:${time.minute}",
            style: TextStyles.whiteMiddle,
          ),
          Text(weather.weather.first.main, style: TextStyles.whiteMiddle),
        ],
      ),
    );
  }
}
