import 'package:forecast_flutter/utils/enums.dart';

class SettingsModel {
  MetricSystem metricSystem;
  BackgroundStyle backgroundStyle;

  SettingsModel({
    this.metricSystem,
    this.backgroundStyle,
  });

  SettingsModel copyWithSettings(SettingsModel settingsModel) => SettingsModel(
        metricSystem: settingsModel.metricSystem ?? metricSystem,
        backgroundStyle: settingsModel.backgroundStyle ?? backgroundStyle,
      );
}
