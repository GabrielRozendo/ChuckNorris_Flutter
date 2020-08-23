import 'package:flutter/material.dart';
import 'app/helpers/dependency_assembly.dart';
import 'app/shared/data/viewmodels/categories_model..dart';
import 'app/shared/data/viewmodels/past_searches_model.dart';
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
        final categoriesViewModel =
            dependencyAssembler.get<CategoriesViewModel>();
        final pastSearches = dependencyAssembler.get<PastSearchesViewModel>();

        return MaterialPageRoute(
          builder: (_) => SearchPage(categoriesViewModel, pastSearches),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}
