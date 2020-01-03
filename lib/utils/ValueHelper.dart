abstract class ValueHelper {
  static double getDouble(dynamic value) {
    if (value is String) {
      try {
        return double.parse(value);
      } catch (error) {
        return 0;
      }
    } else if (value is int) {
      return value.toDouble();
    } else {
      return value;
    }
  }
}
