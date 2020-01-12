import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:forecast_flutter/app/service_locator.dart';
import 'package:forecast_flutter/config/strings.dart';
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateTitle: (BuildContext context) =>
          FlutterI18n.translate(context, Strings.appName),
      routes: <String, WidgetBuilder>{
        //AppRoutes.APP_ROUTE_SPLASH: (BuildContext context) => SplashScreen(),
        AppRoutes.APP_ROUTE_HOME: (BuildContext context) => HomeScreen(),
      },
      home: SplashScreen(),
      localizationsDelegates: [
        FlutterI18nDelegate(
            useCountryCode: false,
            path: "assets/locales",
            forcedLocale: Locale("en", "")),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}

class AppRoutes {
  static const String APP_ROUTE_HOME = "/home";
  static const String APP_ROUTE_SPLASH = "/";
//
//  Route getRoutes({@required RouteSettings routeSettings}) {
//    switch (routeSettings.name) {
//      case APP_ROUTE_SPLASH:
//        {
//          return FadeRoute(
//            page: SplashScreen(),
//          );
//        }
//      case APP_ROUTE_HOME:
//        {
//          return FadeRoute(
//            page: HomeScreen(),
//            settings: routeSettings,
//          );
//        }
//      default:
//        {
//          return FadeRoute(
//            page: HomeScreen(),
//            settings: routeSettings,
//          );
//        }
//    }
//  }
}

//class FadeRoute extends PageRouteBuilder {
//  final Widget page;
//  final RouteSettings settings;
//
//  FadeRoute({this.page, this.settings})
//      : super(
//          settings: settings,
//          pageBuilder: (
//            BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//          ) =>
//              page,
//          transitionsBuilder: (
//            BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//            Widget child,
//          ) =>
//              FadeTransition(
//            opacity: animation,
//            child: child,
//          ),
//        );
//}
