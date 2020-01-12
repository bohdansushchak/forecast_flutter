import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:forecast_flutter/config/text_styles.dart';
import 'package:forecast_flutter/models/current_weather_model.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:forecast_flutter/screens/home/widgets/weather_assest_controler.dart';
import 'package:forecast_flutter/utils/icons_helper.dart';
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
    print(model.currentWeather);
    if (model.currentWeather == null) {
      return SizedBox();
    }
    var current = model.currentWeather.list.first;
    return Column(
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
                      )),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(current.main.temp.toString()),
                      Text(current.main.tempMax.toString()),
                      Text(current.main.tempMin.toString())
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        _buildHoursWeather(model.currentWeather.list)
      ],
    );
  }

  Widget _buildHoursWeather(List<ListWeather> list) {
    var end = list.indexWhere((item) =>
        new DateFormat("yyyy-MM-dd HH:mm:ss").parse(item.dtTxt).day >
        DateTime.now().day);
    List<ListWeather> newList = list.getRange(1, end).toList();
    return Flexible(
        child: ListView.builder(
      itemCount: newList.length,
      itemBuilder: (BuildContext context, int idx) {
        final item = newList[idx];
        return _buildWeatherHourItem(item);
      },
    ));
  }

  Widget _buildWeatherHourItem(ListWeather item) {
    var time = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(item.dtTxt);
    return GrayBox(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "${time.day}:${time.hour}",
            style: TextStyles.whiteMiddle,
          ),
          Text(item.weather.first.main, style: TextStyles.whiteMiddle),
        ],
      ),
    );
  }
}
