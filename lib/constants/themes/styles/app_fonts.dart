import 'app_custom_styles.dart';

abstract class AppFontsStyles implements AppCustomStyles {
  String get title1;
  String get title2;
  String get title3;
  String get title4;
  String get subtitle;
  String get caption;
  String get body;
  String get button;
}

class AppFonts implements AppFontsStyles {
  static String _montserrat = 'Montserrat';
  static String _arvo = 'Arvo';

  @override
  String get title1 => _montserrat;

  @override
  String get title2 => _montserrat;

  @override
  String get title3 => _montserrat;

  @override
  String get title4 => _montserrat;

  @override
  String get subtitle => _arvo;

  @override
  String get caption => _arvo;

  @override
  String get body => _arvo;

  @override
  String get button => _arvo;
}
