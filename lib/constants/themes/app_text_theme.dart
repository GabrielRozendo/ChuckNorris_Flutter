import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'styles/app_text_styles.dart';
import '../app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static final _appTextStyles = AppTextStyles();

  static TextTheme get lightTextTheme {
    return TextTheme(
      headline1: _appTextStyles.title1.c(AppColors.oliveDrab7.shade700),
      subtitle1: _appTextStyles.subtitle.c(AppColors.eerieBlack),
      caption: _appTextStyles.caption.c(AppColors.pistachio.shade700),
      bodyText1: _appTextStyles.body.c(AppColors.eerieBlack),
      button: _appTextStyles.button.c(AppColors.eerieBlack),
    );
  }

  static TextTheme get darkTextTheme {
    return TextTheme(
      headline1: _appTextStyles.title1.c(AppColors.paleSpringBud),
      subtitle1: _appTextStyles.subtitle.c(AppColors.teaGreen.shade700),
      caption: _appTextStyles.caption.c(AppColors.pistachio.shade400),
      bodyText1: _appTextStyles.body.c(AppColors.paleSpringBud.shade400),
      button: _appTextStyles.button.c(AppColors.eerieBlack),
    );
  }
}

extension TextStyleHelpers on TextStyle {
  TextStyle c(Color value) => copyWith(color: value);
}
