import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forecast_flutter/app/service_locator.dart';
import 'package:forecast_flutter/app/weather_app.dart';
import 'package:forecast_flutter/scoped_models/weather_app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final WeatherAppModel model = locator<WeatherAppModel>();

  @override
  void initState() {
    super.initState();
    model.initWeather().whenComplete(() {
      Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<WeatherAppModel>(
      model: model,
      child: ScopedModelDescendant<WeatherAppModel>(
        builder: (context, child, model) => Scaffold(
            body: SafeArea(
              child: Container(
                child: Center(
                  child: Text(
                    "Forecast flutter",
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}
