import 'package:flutter/material.dart';
import 'app_card_theme.dart';
import 'app_text_theme.dart';
import '../app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.pistachio,
        accentColor: AppColors.carrotOrange,
        backgroundColor: AppColors.teaGreen,
        scaffoldBackgroundColor: AppColors.teaGreen,
        primaryTextTheme: AppTextTheme.lightTextTheme,
        primaryColorLight: AppColors.eerieBlack,
        primaryColorDark: AppColors.teaGreen,
        primaryIconTheme: IconThemeData(
          color: AppColors.oliveDrab7,
          size: 20,
        ),
        cardTheme: AppCardTheme.lightCardTheme,
        cardColor: AppCardTheme.lightCardTheme.color,
        shadowColor: AppColors.eerieBlack,
        dividerColor: AppColors.carrotOrange,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.paleSpringBud,
        accentColor: AppColors.carrotOrange,
        backgroundColor: AppColors.eerieBlack,
        scaffoldBackgroundColor: AppColors.eerieBlack,
        primaryTextTheme: AppTextTheme.darkTextTheme,
        primaryColorLight: AppColors.paleSpringBud,
        primaryColorDark: AppColors.eerieBlack,
        primaryIconTheme: IconThemeData(
          color: AppColors.teaGreen,
          size: 20,
        ),
        cardTheme: AppCardTheme.darkCardTheme,
        cardColor: AppCardTheme.darkCardTheme.color,
        shadowColor: AppColors.teaGreen,
        dividerColor: AppColors.carrotOrange,
      );
}
