import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/weather_app.dart';
import 'app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(WeatherApp());
}
