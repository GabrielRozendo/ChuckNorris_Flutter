import 'app_custom_styles.dart';

abstract class AppFontSizesStyles implements AppCustomStyles {
  double get title1;
  double get title2;
  double get title3;
  double get title4;
  double get subtitle;
  double get caption;
  double get body;
  double get button;
}

class AppFontSizes implements AppFontSizesStyles {
  static double scale = 1;

  @override
  double get title1 => 20 * scale;

  @override
  double get title2 => 18 * scale;

  @override
  double get title3 => 16 * scale;

  @override
  double get title4 => 14 * scale;

  @override
  double get subtitle => 14 * scale;

  @override
  double get caption => 14 * scale;

  @override
  double get body => 12 * scale;

  @override
  double get button => 14 * scale;
}
