import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:forecast_flutter/models/CurrentWeatherModel.dart';
import 'package:forecast_flutter/ui/screens/home/widgets/current/WeatherAssestControler.dart';
import 'package:forecast_flutter/utils/IconsHelper.dart';
import 'package:forecast_flutter/utils/config/TextStyles.dart';
import 'package:intl/intl.dart';

class CurrentWeatherWidget extends StatelessWidget {
  CurrentWeatherModel weather;
  String today;
  WeatherAssetsControler _controler;

  CurrentWeatherWidget({@required this.weather, @required this.today}) {
    _controler = WeatherAssetsControler();
  }

  @override
  Widget build(BuildContext context) {
    var current = weather.list.first;
    return Column(
      mainAxisSize: MainAxisSize.max,
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
                  "$today - ${current.weather.first.main}",
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
                        controller: _controler,
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
        _buildHoursWeather(weather.list)
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

  Widget _buildHoursWeather(List<ListWeather> list) {
    var end = list.indexWhere((item) =>
        new DateFormat("yyyy-MM-dd HH:mm:ss").parse(item.dtTxt).day >
        DateTime.now().day);
    List<ListWeather> newList = list.getRange(1, end).toList();
    return Flexible(
        child: ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      itemCount: newList.length,
      itemBuilder: (BuildContext context, int idx) {
        final item = newList[idx];
        return _builsWeatherHourItem(item);
      },
    ));
  }

  Widget _builsWeatherHourItem(ListWeather item) {
    var time = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(item.dtTxt);
    return _buildGrayBox(
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
        ));
  }
}
