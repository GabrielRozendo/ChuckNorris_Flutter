import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardTheme _cardTheme(bool isDark) => CardTheme(
        color: isDark ? AppColors.eerieBlack : AppColors.paleSpringBud.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      );

  static CardTheme get lightCardTheme => _cardTheme(false);

  static CardTheme get darkCardTheme => _cardTheme(true);
}
