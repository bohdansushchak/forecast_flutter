import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:forecast_flutter/utils/config/AppColors.dart';

import 'BackgroundController.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BackgroundContoller _backgroundController;

  @override
  void initState() {
    super.initState();

    _backgroundController = BackgroundContoller();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
            constraints: BoxConstraints.expand(),
            child: FlareActor(
              'assets/BackgroundSky.flr',
              alignment: Alignment.center,
              fit: BoxFit.fill,
              controller: _backgroundController,
            )));
  }
}
