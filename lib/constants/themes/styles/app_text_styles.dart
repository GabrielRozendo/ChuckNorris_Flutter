import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_custom_styles.dart';
import 'app_fonts.dart';
import 'app_font_sizes.dart';

abstract class AppCustomStylesText implements AppCustomStyles {
  TextStyle get title1;
  TextStyle get title2;
  TextStyle get title3;
  TextStyle get title4;
  TextStyle get subtitle;
  TextStyle get caption;
  TextStyle get body;
  TextStyle get button;
}

class AppTextStyles implements AppCustomStylesText {
  static final _appFonts = AppFonts();
  static final _appFontSizes = AppFontSizes();

  @override
  TextStyle get title1 => TextStyle(
        fontSize: _appFontSizes.title1,
        fontFamily: _appFonts.title1,
        fontWeight: FontWeight.w900,
      );

  @override
  TextStyle get title2 => TextStyle(
        fontSize: _appFontSizes.title2,
        fontFamily: _appFonts.title2,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      );

  @override
  TextStyle get title3 => TextStyle(
        fontSize: _appFontSizes.title3,
        fontFamily: _appFonts.title3,
        fontWeight: FontWeight.w300,
      );

  @override
  TextStyle get title4 => TextStyle(
        fontSize: _appFontSizes.title4,
        fontFamily: _appFonts.title4,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get subtitle => TextStyle(
        fontSize: _appFontSizes.subtitle,
        fontFamily: _appFonts.subtitle,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get body => TextStyle(
        fontSize: _appFontSizes.body,
        fontFamily: _appFonts.body,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get caption => TextStyle(
        fontSize: _appFontSizes.caption,
        fontFamily: _appFonts.caption,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get button => TextStyle(
        fontSize: _appFontSizes.button,
        fontFamily: _appFonts.button,
        fontWeight: FontWeight.w600,
      );

  // static TextStyle get body => TextStyle(fontFamily: AppFonts.body);
  // static TextStyle get titleFont => TextStyle(fontFamily: AppFonts.title1);

  // static TextStyle get title =>
  //     titleFont.copyWith(fontSize: AppFontSizes.title);
  // static TextStyle get titleLight =>
  //     title.copyWith(fontWeight: FontWeight.w300);

  // static TextStyle get body => bodyFont.copyWith(
  //     fontSize: AppFontSizes.body, fontWeight: FontWeight.w300);
  // static TextStyle get bodySm => body.copyWith(fontSize: AppFontSizes.bodySm);
}

extension CustomStyles on TextTheme {
  TextStyle get test => TextStyle();
}
