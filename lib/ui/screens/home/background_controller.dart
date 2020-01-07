import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';


final List<String> backgroundAnimations = ["island01", "island02", "island03", "island04", "island05", "island06"];

class BackgroundContoller extends FlareControls {

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);

    play(backgroundAnimations[2]);
  }

  onCompleted(String name) {
    play(backgroundAnimations[3]);
  }
}
