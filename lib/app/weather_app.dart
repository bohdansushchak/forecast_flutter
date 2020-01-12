import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:forecast_flutter/screens/base_view.dart';
import 'package:forecast_flutter/screens/home/home_screen.dart';
import 'package:forecast_flutter/screens/splash/splash_screen.dart';

class WeatherApp extends StatelessWidget {
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  WeatherApp() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherAppModel>(
      builder: (BuildContext context, Widget child, WeatherAppModel model) =>
          MaterialApp(
        title: 'Forecast flutter',
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings routeSettings) => AppRoutes().getRoutes(
          routeSettings: routeSettings,
          model: model,
        ),
      ),
    );
  }
}

class AppRoutes {
  static const String APP_ROUTE_HOME = "/home";
  static const String APP_ROUTE_SETTINGS = "/settings";

  Route getRoutes({
    @required RouteSettings routeSettings,
    @required WeatherAppModel model,
  }) {
    switch (routeSettings.name) {
      case APP_ROUTE_HOME:
        {
          return FadeRoute(
            page: HomeScreen(
              model: model,
            ),
            settings: routeSettings,
          );
        }
      default:
        {
          return FadeRoute(
            page: SplashScreen(
              model: model,
            ),
            settings: routeSettings,
          );
        }
    }
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  FadeRoute({this.page, this.settings})
      : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
