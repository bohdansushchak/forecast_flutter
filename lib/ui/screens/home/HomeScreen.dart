import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:forecast_flutter/app/AppRoutes.dart';
import 'package:forecast_flutter/enums/ViewState.dart';
import 'package:forecast_flutter/scoped_models/HomeModel.dart';
import 'package:forecast_flutter/ui/screens/home/widgets/current/CurrentWeatherWidget.dart';
import 'package:forecast_flutter/ui/widgets/BusyOverlay.dart';
import 'package:forecast_flutter/utils/config/AppColors.dart';

import '../../BaseView.dart';
import 'BackgroundController.dart';

class HomeScreen extends StatelessWidget {
  final BackgroundContoller _backgroundController = BackgroundContoller();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.Busy,
              child: Scaffold(
                  backgroundColor: AppColors.white,
                  floatingActionButton: SpeedDial(
                    overlayColor: AppColors.grayDark,
                    overlayOpacity: 0.6,
                    animatedIcon: AnimatedIcons.close_menu,
                    children: [
                      SpeedDialChild(
                          child: Icon(
                            Icons.settings,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.APP_ROUTE_SETTINGS);
                          }),
                      SpeedDialChild(child: Icon(Icons.list)),
                      SpeedDialChild(
                          child: Icon(Icons.cloud),
                          onTap: () {
                            model.updateCurrentWeather();
                          }),
                    ],
                  ),
                  body: Stack(
                    children: [
                      Container(
                          constraints: BoxConstraints.expand(),
                          child: FlareActor(
                            'assets/BackgroundSky.flr',
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                            controller: _backgroundController,
                          )),
                      _buildContent(model)
                    ],
                  )),
            ));
  }

  Widget _buildContent(HomeModel model) {
    if (model.currentWeather == null) {
      return SizedBox();
    }
    return SafeArea(
        child: CurrentWeatherWidget(
      weather: model.currentWeather,
      today: model.today,
    ));
  }
}
