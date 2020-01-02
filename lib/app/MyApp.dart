import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppRoutes.dart';

class MyApp extends StatelessWidget {
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forecast flutter',
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes().getRoutes,
      // builder: (BuildContext context, Widget child) {
      //   return new Padding(
      //     padding: const EdgeInsets.only(),
      //     child: child,
      //   );
      // },
    );
  }
}
