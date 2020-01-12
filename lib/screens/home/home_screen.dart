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

const int CURRENT_WEATHER = 0;
const int WEEK_WEATHER = 1;
const int SETTINGS = 2;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<WeatherAppModel>(
      model: locator<WeatherAppModel>(),
      child: ScopedModelDescendant<WeatherAppModel>(
        builder: (context, child, model) => HomeContent(model: model),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  final WeatherAppModel model;

  HomeContent({@required this.model});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController pageController;

  int currentPage = 1;

  _HomeContentState()
      : pageController = PageController(initialPage: CURRENT_WEATHER);

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
                    child:
                        PageView(controller: pageController, children: <Widget>[
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
    );
  }

  String getAppBarTitle() {
    if (currentPage == SETTINGS) {
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
