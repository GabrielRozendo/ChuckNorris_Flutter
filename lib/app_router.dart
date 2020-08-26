import 'package:chucknorris_quotes/app/shared/repositories/quotes/service/quotes_repository.dart';
import 'package:chucknorris_quotes/app/ui/pages/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => dependencyAssembler.get<CategoriesViewModel>(),
            child: SplashPage(),
          ),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case AppRoutes.search:
        final repository = dependencyAssembler.get<QuotesRepository>();
        final categoriesViewModel =
            dependencyAssembler.get<CategoriesViewModel>();
        final pastSearchesViewModel =
            dependencyAssembler.get<PastSearchesViewModel>();

        return MaterialPageRoute(
          builder: (_) => SearchPage(
            repository,
            categoriesViewModel.randomize(),
            pastSearchesViewModel,
          ),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}
