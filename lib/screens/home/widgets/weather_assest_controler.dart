import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class WeatherAssetsController extends FlareControls {
  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);

    play('go');
  }

  onCompleted(String name) {
    play('go');
  }
}
