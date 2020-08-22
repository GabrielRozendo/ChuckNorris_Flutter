import 'package:flutter/material.dart';
import 'app_card_theme.dart';
import 'app_text_theme.dart';
import '../app_colors.dart';

enum AppThemes { lightTheme, darkTheme }

extension AppThemesExtension on AppThemes {
  static AppThemes get defaultTheme => AppThemes.lightTheme;

  ThemeData get themeData {
    switch (this) {
      case AppThemes.darkTheme:
        return AppTheme.darkTheme;

      case AppThemes.lightTheme:
      default:
        return AppTheme.lightTheme;
    }
  }
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.greenMunsell,
        accentColor: AppColors.goldCrayola,
        backgroundColor: AppColors.lightYellow,
        scaffoldBackgroundColor: AppColors.lightYellow,
        primaryTextTheme: AppTextTheme.lightTextTheme,
        primaryColorLight: AppColors.eerieBlack,
        primaryColorDark: AppColors.lightYellow,
        primaryIconTheme: IconThemeData(
          color: AppColors.greenMunsell,
          size: 20,
        ),
        cardTheme: AppCardTheme.lightCardTheme,
        cardColor: AppCardTheme.lightCardTheme.color,
        shadowColor: AppColors.eerieBlack,
        dividerColor: AppColors.greenMunsell,
        errorColor: AppColors.orangeSoda,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.lightYellow,
        accentColor: AppColors.goldCrayola,
        backgroundColor: AppColors.eerieBlack,
        scaffoldBackgroundColor: AppColors.eerieBlack,
        primaryTextTheme: AppTextTheme.darkTextTheme,
        primaryColorLight: AppColors.lightYellow,
        primaryColorDark: AppColors.eerieBlack,
        primaryIconTheme: IconThemeData(
          color: AppColors.lightYellow,
          size: 20,
        ),
        cardTheme: AppCardTheme.darkCardTheme,
        cardColor: AppCardTheme.darkCardTheme.color,
        shadowColor: AppColors.lightYellow,
        dividerColor: AppColors.goldCrayola,
        errorColor: AppColors.orangeSoda,
      );
}
