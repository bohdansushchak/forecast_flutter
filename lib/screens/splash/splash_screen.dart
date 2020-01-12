import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forecast_flutter/app/weather_app.dart';
import 'package:forecast_flutter/config/app_colors.dart';
import 'package:forecast_flutter/config/text_styles.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';

class SplashScreen extends StatefulWidget {
  final WeatherAppModel model;

  SplashScreen({@required this.model});

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    widget.model.initWeather().whenComplete(() {
      Navigator.of(context).pushReplacementNamed(AppRoutes.APP_ROUTE_HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          child: Center(
              child: Text("Forecast flutter", style: TextStyles.whiteBig)),
        ),
      ),
    );
  }
}
