import 'package:flutter/material.dart';

import 'app_router.dart';
import 'constants/app_routes.dart';
import 'constants/app_strings.dart';
import 'constants/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.initialRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
