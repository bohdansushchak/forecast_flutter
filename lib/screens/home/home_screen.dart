import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:forecast_flutter/app/service_locator.dart';
import 'package:forecast_flutter/config/app_colors.dart';
import 'package:forecast_flutter/config/assets.dart';
import 'package:forecast_flutter/config/strings.dart';
import 'package:forecast_flutter/config/text_styles.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:forecast_flutter/screens/home/widgets/current_weather.dart';
import 'package:forecast_flutter/screens/home/widgets/settings.dart';
import 'package:forecast_flutter/screens/home/widgets/wethear_week.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
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
    return ScopedModel<WeatherAppModel>(
      model: locator<WeatherAppModel>(),
      child: ScopedModelDescendant<WeatherAppModel>(
        builder: (BuildContext context, Widget child, WeatherAppModel model) =>
            Scaffold(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    AppBar(text: getAppBarTitle()),
                    Expanded(
                      child: SafeArea(
                        top: false,
                        child: PageView(
                            controller: pageController,
                            children: <Widget>[
                              CurrentWeather(model: model),
                              WeatherWeek(model: model),
                              Settings(model: model),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getAppBarTitle() {
    if (currentPage == 2) {
      return FlutterI18n.translate(context, Strings.appBarSettings);
    }
    return "London";
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black45, Colors.black26]),
          borderRadius: BorderRadius.circular(30.0)),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              text,
              style: TextStyles.appBarTitle,
            ),
          ),
        ),
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
