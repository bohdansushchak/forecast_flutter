import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:forecast_flutter/config/app_colors.dart';
import 'package:forecast_flutter/config/assets.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:forecast_flutter/screens/home/widgets/current_weather.dart';
import 'package:forecast_flutter/screens/home/widgets/settings.dart';
import 'package:forecast_flutter/screens/home/widgets/wethear_week.dart';

class HomeScreen extends StatefulWidget {
  final WeatherAppModel model;

  HomeScreen({
    @required this.model,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController;

  int currentPage = 0;

  _HomeScreenState() : pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page.floor();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var model = widget.model;
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: Fab(
        onCurrentPressed: () => _changePage(0),
        onListPressed: () => _changePage(1),
        onSettingsPressed: () => _changePage(2),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              child: FlareActor(
                Assets.backgroundSky,
                alignment: Alignment.center,
                fit: BoxFit.fill,
                controller: model.backgroundController,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    text: "London",
                  ),
                  Expanded(
                    child: PageView(controller: pageController, children: <Widget>[
                      CurrentWeather(
                        weather: model.currentWeather,
                        today: model.today,
                      ),
                      WeatherWeek(),
                      Settings(
                        model: model,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(int newPage) {
    if (newPage != currentPage) {
      pageController.animateToPage(newPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}

class AppBar extends StatelessWidget {
  final String text;

  AppBar({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
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
