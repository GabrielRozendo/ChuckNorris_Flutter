import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'styles/app_text_styles.dart';
import '../app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static final _appTextStyles = AppTextStyles();

  static TextTheme get lightTextTheme => TextTheme(
        headline1: _appTextStyles.title1.c(AppColors.darkjunglegreen),
        headline2: _appTextStyles.title2.c(AppColors.darkjunglegreen),
        headline3: _appTextStyles.title3.c(AppColors.eerieBlack),
        headline4: _appTextStyles.title4.c(AppColors.eerieBlack),
        subtitle1: _appTextStyles.subtitle.c(AppColors.greenMunsell.shade900),
        caption: _appTextStyles.caption.c(AppColors.eerieBlack),
        bodyText2: _appTextStyles.body.c(AppColors.eerieBlack),
        button: _appTextStyles.button.c(AppColors.darkjunglegreen),
      );

  static TextTheme get darkTextTheme => TextTheme(
        headline1: _appTextStyles.title1.c(AppColors.goldCrayola),
        headline2: _appTextStyles.title2.c(AppColors.lightYellow),
        headline3: _appTextStyles.title3.c(AppColors.lightYellow),
        headline4: _appTextStyles.title4.c(AppColors.lightYellow),
        subtitle1: _appTextStyles.subtitle.c(AppColors.lightYellow),
        caption: _appTextStyles.caption.c(AppColors.lightYellow),
        bodyText2: _appTextStyles.body.c(AppColors.lightYellow),
        button: _appTextStyles.button.c(AppColors.lightYellow),
      );
}

extension TextStyleHelpers on TextStyle {
  TextStyle c(Color value) => copyWith(color: value);
}
