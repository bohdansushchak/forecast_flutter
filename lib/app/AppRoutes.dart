import 'package:flutter/material.dart';
import 'package:forecast_flutter/ui/home/HomeScreen.dart';
import 'package:forecast_flutter/ui/settings/SettingsScreen.dart';
import 'package:forecast_flutter/ui/splash/SplashScreen.dart';

class AppRoutes {

  static const String APP_ROUTE_HOME = "/home";
  static const String APP_ROUTE_SETTINGS = "/settings";

  @override
  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_HOME:
        {
          return FadeRoute(page: HomeScreen(), settings: routeSettings);
        }
      case APP_ROUTE_SETTINGS:
        {
          return FadeRoute(page: SettingsScreen(), settings: routeSettings);
        }
      default:
        {
          return FadeRoute(page: SplashScreen(), settings: routeSettings);
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
