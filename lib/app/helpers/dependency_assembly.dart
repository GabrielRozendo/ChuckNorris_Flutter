import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/data/models/search_result.dart';
import '../shared/data/viewmodels/shared_prefs.dart';
import '../shared/data/viewmodels/past_searches_model.dart';
import '../shared/data/viewmodels/categories_model..dart';
import '../shared/repositories/quotes/quotes_repository.dart';
import '../../constants/app_sharedpref.dart';

GetIt dependencyAssembler = GetIt.I;

class DependencyAssembly {
  static SharedPrefsViewModelProtocol _registerSharedPrefs(
      SharedPreferences sharedPrefs) {
    return SharedPrefsViewModel(sharedPrefs);
  }

  static PastSearchesViewModel _registerPastSearches(
      SharedPrefsViewModelProtocol sharedPrefsVM) {
    final list = sharedPrefsVM.getStringList(AppSharedPref.pastSearches) ?? [];
    final listSearchResult = Set<SearchResult>.from(
      list.map((e) => SearchResult.fromRawJson(e)),
    );

    return PastSearchesViewModel(sharedPrefsVM, listSearchResult);
  }

  static void setupDependencyAssembler(SharedPreferences sharedPrefs) {
    final sharedPrefsVM = _registerSharedPrefs(sharedPrefs);
    dependencyAssembler.registerSingleton<SharedPrefsViewModelProtocol>(
      sharedPrefsVM,
    );

    dependencyAssembler.registerSingleton<PastSearchesViewModel>(
      _registerPastSearches(sharedPrefsVM),
    );

    final quotesRepository = QuotesRepository();
    dependencyAssembler.registerFactory(() => quotesRepository);
    dependencyAssembler.registerSingleton<CategoriesViewModel>(
      CategoriesViewModel(sharedPrefsVM, quotesRepository),
    );
  }
}
