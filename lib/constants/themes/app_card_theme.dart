import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static double radius = 10;

  static CardTheme _cardTheme(bool isDark) => CardTheme(
        color: isDark ? AppColors.darkjunglegreen : AppColors.goldCrayola,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: AppColors.aliceblue, width: 1),
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 2,
      );

  static CardTheme get lightCardTheme => _cardTheme(false);

  static CardTheme get darkCardTheme => _cardTheme(true);
}
