import 'dart:math';

import 'base_viewmodel.dart';
import 'shared_prefs.dart';

import '../models/category.dart';
import '../../repositories/quotes/service/quotes_repository.dart';
import '../../../helpers/enum/view_state.dart';
import '../../../../constants/app_sharedpref.dart';
import '../../../../constants/app_settings.dart';

class CategoriesViewModel extends BaseViewModel {
  final SharedPrefsViewModelProtocol _sharedPreferences;
  CategoriesViewModel(this._sharedPreferences, QuotesRepository repository)
      : assert(_sharedPreferences != null && repository != null) {
    _populate(repository);
  }

  List<Category> _categories;
  List<Category> get categories => _categories;

  void _populate(QuotesRepository repository) {
    applyState(ViewState.Busy);

    final list = _sharedPreferences.getStringList(AppSharedPref.categories);
    if (list == null)
      _fetchCategories(repository);
    else
      _getCategoriesSaved(list);
  }

  void _getCategoriesSaved(List<String> list) {
    _categories = List<Category>.from(
      list.map((e) => Category.fromRawJson(e)),
    );

    applyState(ViewState.Idle);
  }

  void _fetchCategories(QuotesRepository repository) async {
    final categories = await repository.getCategories();
    final jsonList = categories.map<String>((e) => e.toRawJson()).toList();

    if (await _save(jsonList)) _categories = categories;

    applyState(ViewState.Idle);
  }

  Future<bool> _save(List<String> json) => _sharedPreferences
      .setStringList(AppSharedPref.categories, json)
      .then((value) => value)
      .catchError((_) => false);

  List<int> randomIndexes(int size, int maxNumber) {
    if (size > maxNumber)
      throw Exception('Size must not be bigger than max number');

    final numbers = Set<int>();
    final random = Random();

    while (numbers.length < size) {
      final value = random.nextInt(maxNumber);
      numbers.add(value);
    }

    return numbers.toList();
  }

  List<Category> randomize({int size = AppSettings.maxCategories}) {
    final randomIndexesList = randomIndexes(size, _categories.length - 1);
    final randomCategoryList =
        randomIndexesList.map((i) => _categories[i]).toList();
    return randomCategoryList;
  }
}
