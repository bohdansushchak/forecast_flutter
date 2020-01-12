import 'enums.dart';

abstract class MetricHelper {
  static String getTempMetric(MetricSystem metricSystem) {
    switch (metricSystem) {
      case MetricSystem.celsius:
        return "°C";
      case MetricSystem.fahrenheit:
        return "°F";
      case MetricSystem.kelvin:
        return "°K";
    }
    return "";
  }
}
