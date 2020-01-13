import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:forecast_flutter/config/app_colors.dart';
import 'package:forecast_flutter/config/strings.dart';
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
            margin: EdgeInsets.only(top: 25, bottom: 15),
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
          WeatherStats(weather: current),
          WeatherByHour(list: model.currentWeather.list),
        ],
      ),
    );
  }
}

class WeatherStats extends StatelessWidget {
  ListWeather weather;

  WeatherStats({@required this.weather});

  @override
  Widget build(BuildContext context) {
    return GrayBox(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15.0),
      child: Table(children: [
        TableRow(children: [
          StatsItem(
            label: FlutterI18n.translate(context, Strings.pressure),
            value: "${weather.main.pressure.floor()}hPa",
          ),
          StatsItem(
            label: FlutterI18n.translate(context, Strings.humidity),
            value: "${weather.main.humidity.floor()}%",
          ),
          StatsItem(
            label: FlutterI18n.translate(context, Strings.wind),
            value: weather.wind.speed.toString(),
          ),
        ]),
        //TableRow(children: []),
      ]),
    );
  }
}

class StatsItem extends StatelessWidget {
  final String label;
  final String value;

  StatsItem({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1, color: AppColors.black)),
          child: Center(
            child: Text(value),
          ),
        ),
        Text(
          label,
          style: TextStyles.weatherStatLabel,
        )
      ],
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
