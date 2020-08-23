import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/helpers/dependency_assembly.dart';
import 'app_router.dart';
import 'constants/app_routes.dart';
import 'constants/app_strings.dart';
import 'constants/themes/app_theme.dart';
import 'app/shared/repositories/providers/home_results.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  DependencyAssembly.setupDependencyAssembler(sharedPrefs);

  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeResultsChanger(),
      child: MaterialApp(
        title: AppStrings.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.initialRoute,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
