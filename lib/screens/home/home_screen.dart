import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:forecast_flutter/config/app_colors.dart';
import 'package:forecast_flutter/config/assets.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:forecast_flutter/screens/home/widgets/current_weather.dart';
import 'package:forecast_flutter/utils/view_state.dart';
import 'package:forecast_flutter/widgets/busy_overlay.dart';

import 'background_controller.dart';

class HomeScreen extends StatelessWidget {
  final WeatherAppModel model;
  final BackgroundController _backgroundController = BackgroundController();

  HomeScreen({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(
      show: model.state == ViewState.Busy,
      child: Scaffold(
        backgroundColor: AppColors.white,
        floatingActionButton: Fab(),
        body: Stack(
          children: [
            Container(
                constraints: BoxConstraints.expand(),
                child: FlareActor(
                  Assets.backgroundSky,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  controller: _backgroundController,
                )),
            _buildContent(model)
          ],
        ),
      ),
    );
  }

  Widget _buildContent(WeatherAppModel model) {
    if (model.currentWeather == null) {
      return SizedBox();
    }
    return SafeArea(
      child: CurrentWeather(
        weather: model.currentWeather,
        today: model.today,
      ),
    );
  }
}

class Fab extends StatelessWidget {
  final Function onCurrentPressed;
  final Function onListPressed;
  final Function onSettingsPressed;

  const Fab({
    Key key,
    @required this.onCurrentPressed,
    @required this.onListPressed,
    @required this.onSettingsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      overlayColor: AppColors.grayDark,
      overlayOpacity: 0.6,
      animatedIcon: AnimatedIcons.close_menu,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.settings,
          ),
          onTap: onSettingsPressed,
        ),
        SpeedDialChild(
          child: Icon(Icons.list),
          onTap: onListPressed,
        ),
        SpeedDialChild(
          child: Icon(Icons.cloud),
          onTap: onCurrentPressed,
        ),
      ],
    );
  }
}
