import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/MyApp.dart';
import 'app/ServiceLocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
