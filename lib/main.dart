import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
