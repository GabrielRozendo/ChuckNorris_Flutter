import 'package:flutter/material.dart';
import 'app/ui/pages/HomePage.dart';
import 'app/ui/pages/SearchPage.dart';
import 'constants/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case AppRoutes.search:
        final arguments = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => SearchPage(arguments),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}
