import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/data/viewmodels/cache_viewmodel.dart';
import '../shared/data/viewmodels/categories_model..dart';
import '../shared/data/viewmodels/past_searches_model.dart';
import '../shared/data/viewmodels/shared_prefs_settings.dart';
import '../shared/network/http_session.dart';
import '../shared/repositories/quotes/quotes_repository.dart';

GetIt dependencyAssembler = GetIt.I;

class DependencyAssembly {
  static void setupDependencyAssembler(SharedPreferences sharedPrefs) {
    if (!dependencyAssembler.isRegistered<SharedPreferences>())
      dependencyAssembler.registerSingleton(sharedPrefs);

    dependencyAssembler.registerFactory(() => HttpSession());

    dependencyAssembler.registerFactory(() => QuotesRepository());

    dependencyAssembler.registerLazySingleton<PastSearchesViewModel>(
      () => PastSearchesViewModel(),
    );

    dependencyAssembler.registerLazySingleton<CategoriesViewModel>(
      () => CategoriesViewModel(),
    );
    dependencyAssembler.registerLazySingleton<SharedPrefsSettings>(
      () => SharedPrefsSettings(),
    );
    dependencyAssembler.registerLazySingleton<CacheViewModel>(
      () => CacheViewModel(),
    );
  }
}
