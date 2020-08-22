import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor paleSpringBud =
      MaterialColor(_paleSpringBudPrimaryValue, <int, Color>{
    50: Color(0xFFFCFDF7),
    100: Color(0xFFF9FAEB),
    200: Color(0xFFF5F7DE),
    300: Color(0xFFF0F4D1),
    400: Color(0xFFEDF1C7),
    500: Color(_paleSpringBudPrimaryValue),
    600: Color(0xFFE7EDB7),
    700: Color(0xFFE4EBAE),
    800: Color(0xFFE1E8A6),
    900: Color(0xFFDBE498),
  });
  static const int _paleSpringBudPrimaryValue = 0xFFEAEFBD; //#EAEF8D

  static const MaterialColor paleSpringBudAccent =
      MaterialColor(_paleSpringBudAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_paleSpringBudAccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
  });
  static const int _paleSpringBudAccentValue = 0xFFFFFFFF; //#FFFFFF

  static const MaterialColor teaGreen =
      MaterialColor(_teaGreenPrimaryValue, <int, Color>{
    50: Color(0xFFF9FCF5),
    100: Color(0xFFEFF7E6),
    200: Color(0xFFE4F1D6),
    300: Color(0xFFD9EBC5),
    400: Color(0xFFD1E7B8),
    500: Color(_teaGreenPrimaryValue),
    600: Color(0xFFC3E0A5),
    700: Color(0xFFBCDC9B),
    800: Color(0xFFB5D892),
    900: Color(0xFFA9D082),
  });
  static const int _teaGreenPrimaryValue = 0xFFC9E3AC; //#C9E3AC

  static const MaterialColor teaGreenAccent =
      MaterialColor(_teaGreenAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_teaGreenAccentValue),
    400: Color(0xFFFAFFF5),
    700: Color(0xFFEDFFDB),
  });
  static const int _teaGreenAccentValue = 0xFFFFFFFF; //#FFFFFF

  static const MaterialColor pistachio =
      MaterialColor(_pistachioPrimaryValue, <int, Color>{
    50: Color(0xFFF2F7ED),
    100: Color(0xFFDEECD3),
    200: Color(0xFFC8DFB6),
    300: Color(0xFFB1D299),
    400: Color(0xFFA1C883),
    500: Color(_pistachioPrimaryValue),
    600: Color(0xFF88B865),
    700: Color(0xFF7DAF5A),
    800: Color(0xFF73A750),
    900: Color(0xFF61993E),
  });
  static const int _pistachioPrimaryValue = 0xFF90BE6D; //#90BE6D

  static const MaterialColor pistachioAccent =
      MaterialColor(_pistachioAccentValue, <int, Color>{
    100: Color(0xFFF3FFEB),
    200: Color(_pistachioAccentValue),
    400: Color(0xFFB2FF85),
    700: Color(0xFFA2FF6C),
  });
  static const int _pistachioAccentValue = 0xFFD2FFB8; //#D2FFB8

  static const MaterialColor carrotOrange =
      MaterialColor(_carrotOrangePrimaryValue, <int, Color>{
    50: Color(0xFFFCF2E2),
    100: Color(0xFFF9DEB7),
    200: Color(0xFFF5C888),
    300: Color(0xFFF0B158),
    400: Color(0xFFEDA134),
    500: Color(_carrotOrangePrimaryValue),
    600: Color(0xFFE7880E),
    700: Color(0xFFE47D0C),
    800: Color(0xFFE17309),
    900: Color(0xFFDB6105),
  });
  static const int _carrotOrangePrimaryValue = 0xFFEA9010; //#EA9010

  static const MaterialColor carrotOrangeAccent =
      MaterialColor(_carrotOrangeAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_carrotOrangeAccentValue),
    400: Color(0xFFFFC29D),
    700: Color(0xFFFFB284),
  });
  static const int _carrotOrangeAccentValue = 0xFFFFE2D0; //#FFE200

  static const MaterialColor oliveDrab7 =
      MaterialColor(_oliveDrab7PrimaryValue, <int, Color>{
    50: Color(0xFFE7E7E4),
    100: Color(0xFFC3C3BC),
    200: Color(0xFF9B9B8F),
    300: Color(0xFF737362),
    400: Color(0xFF555541),
    500: Color(_oliveDrab7PrimaryValue),
    600: Color(0xFF31311B),
    700: Color(0xFF2A2A17),
    800: Color(0xFF232312),
    900: Color(0xFF16160A),
  });
  static const int _oliveDrab7PrimaryValue = 0xFF37371F; //#37371F

  static const MaterialColor oliveDrab7Accent =
      MaterialColor(_oliveDrab7AccentValue, <int, Color>{
    100: Color(0xFFFFFF58),
    200: Color(_oliveDrab7AccentValue),
    400: Color(0xFFF1F100),
    700: Color(0xFFD8D800),
  });
  static const int _oliveDrab7AccentValue = 0xFFFFFF25; //#FFFF25

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

}
