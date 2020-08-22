import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor greenMunsell =
      MaterialColor(_greenMunsellPrimaryValue, <int, Color>{
    50: Color(0xFFE0F5EF),
    100: Color(0xFFB3E5D7),
    200: Color(0xFF80D4BC),
    300: Color(0xFF4DC2A1),
    400: Color(0xFF26B58C),
    500: Color(_greenMunsellPrimaryValue),
    600: Color(0xFF00A070),
    700: Color(0xFF009765),
    800: Color(0xFF008D5B),
    900: Color(0xFF007D48),
  });
  static const int _greenMunsellPrimaryValue = 0xFF00A878; //#00A878

  static const MaterialColor greenMunsellAccent =
      MaterialColor(_greenMunsellAccentValue, <int, Color>{
    100: Color(0xFFAAFFD5),
    200: Color(_greenMunsellAccentValue),
    400: Color(0xFF44FFA3),
    700: Color(0xFF2AFF97),
  });
  static const int _greenMunsellAccentValue = 0xFF77FFBC; //#77FF8C

  static const MaterialColor lightYellow =
      MaterialColor(_lightYellowPrimaryValue, <int, Color>{
    50: Color(0xFFFDFEFB),
    100: Color(0xFFFBFEF5),
    200: Color(0xFFF8FDEE),
    300: Color(0xFFF5FCE7),
    400: Color(0xFFF2FBE1),
    500: Color(_lightYellowPrimaryValue),
    600: Color(0xFFEEF9D8),
    700: Color(0xFFECF9D3),
    800: Color(0xFFE9F8CE),
    900: Color(0xFFE5F6C5),
  });
  static const int _lightYellowPrimaryValue = 0xFFF0FADC; //#F0FADC

  static const MaterialColor lightYellowAccent =
      MaterialColor(_lightYellowAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_lightYellowAccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
  });
  static const int _lightYellowAccentValue = 0xFFFFFFFF; //#FFFFFF

  static const MaterialColor goldCrayola =
      MaterialColor(_goldCrayolaPrimaryValue, <int, Color>{
    50: Color(0xFFFEF8EF),
    100: Color(0xFFFBECD7),
    200: Color(0xFFF9E0BC),
    300: Color(0xFFF7D4A1),
    400: Color(0xFFF5CA8C),
    500: Color(_goldCrayolaPrimaryValue),
    600: Color(0xFFF1BB70),
    700: Color(0xFFEFB365),
    800: Color(0xFFEDAB5B),
    900: Color(0xFFEA9E48),
  });
  static const int _goldCrayolaPrimaryValue = 0xFFF3C178; //#F3C178

  static const MaterialColor goldCrayolaAccent =
      MaterialColor(_goldCrayolaAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_goldCrayolaAccentValue),
    400: Color(0xFFFFEDDA),
    700: Color(0xFFFFE1C1),
  });
  static const int _goldCrayolaAccentValue = 0xFFFFFFFF; //#FFFFFF

  static const MaterialColor orangeSoda =
      MaterialColor(_orangeSodaPrimaryValue, <int, Color>{
    50: Color(0xFFFFECE8),
    100: Color(0xFFFFCFC6),
    200: Color(0xFFFFAFA0),
    300: Color(0xFFFE8E7A),
    400: Color(0xFFFE765E),
    500: Color(_orangeSodaPrimaryValue),
    600: Color(0xFFFE563B),
    700: Color(0xFFFE4C32),
    800: Color(0xFFFE422A),
    900: Color(0xFFFD311C),
  });
  static const int _orangeSodaPrimaryValue = 0xFFFE5E41; //#FE5E41

  static const MaterialColor orangeSodaAccent =
      MaterialColor(_orangeSodaAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_orangeSodaAccentValue),
    400: Color(0xFFFFCFCB),
    700: Color(0xFFFFB8B2),
  });
  static const int _orangeSodaAccentValue = 0xFFFFFEFE; //#FFFEFE

  static const MaterialColor eerieBlack =
      MaterialColor(_eerieBlackPrimaryValue, <int, Color>{
    50: Color(0xFFE3E3E3),
    100: Color(0xFFBABABA),
    200: Color(0xFF8C8C8C),
    300: Color(0xFF5E5E5E),
    400: Color(0xFF3C3C3C),
    500: Color(_eerieBlackPrimaryValue),
    600: Color(0xFF161616),
    700: Color(0xFF121212),
    800: Color(0xFF0E0E0E),
    900: Color(0xFF080808),
  });
  static const int _eerieBlackPrimaryValue = 0xFF191919; //#191919

  static const MaterialColor eerieBlackAccent =
      MaterialColor(_eerieBlackAccentValue, <int, Color>{
    100: Color(0xFFFF5050),
    200: Color(_eerieBlackAccentValue),
    400: Color(0xFFE90000),
    700: Color(0xFFCF0000),
  });
  static const int _eerieBlackAccentValue = 0xFFFF1D1D; //#FF1D1D

  static const MaterialColor darkjunglegreen =
      MaterialColor(_darkJungleGreenPrimaryValue, <int, Color>{
    50: Color(0xFFE2E4E4),
    100: Color(0xFFB6BCBB),
    200: Color(0xFF86908D),
    300: Color(0xFF56635F),
    400: Color(0xFF31413D),
    500: Color(_darkJungleGreenPrimaryValue),
    600: Color(0xFF0B1C18),
    700: Color(0xFF091814),
    800: Color(0xFF071310),
    900: Color(0xFF030B08),
  });
  static const int _darkJungleGreenPrimaryValue = 0xFF0D201B; //#0D201B

  static const MaterialColor darkjunglegreenAccent =
      MaterialColor(_darkJungleGreenAccentValue, <int, Color>{
    100: Color(0xFF50FFA7),
    200: Color(_darkJungleGreenAccentValue),
    400: Color(0xFF00E974),
    700: Color(0xFF00CF68),
  });
  static const int _darkJungleGreenAccentValue = 0xFF1DFF8E; //#1DFF8E
}
