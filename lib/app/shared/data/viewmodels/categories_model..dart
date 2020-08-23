import 'dart:math';
import 'package:chucknorris_quotes/app/helpers/enum/view_state.dart';
import 'package:chucknorris_quotes/constants/app_sharedpref.dart';

import 'base_viewmodel.dart';

import '../models/category.dart';
import '../../repositories/quotes/service/quotes_repository.dart';
import '../../../../constants/app_settings.dart';
import 'shared_prefs.dart';

class CategoriesViewModel extends BaseViewModel {
  final SharedPrefsViewModelProtocol _sharedPreferences;
  CategoriesViewModel(this._sharedPreferences, QuotesRepository repository)
      : assert(_sharedPreferences != null && repository != null) {
    _populate(repository);
  }

  void _populate(QuotesRepository repository) {
    final list = _sharedPreferences.getStringList(AppSharedPref.categories);
    if (list == null)
      _getCategories(repository);
    else
      _categories = List<Category>.from(
        list.map((e) => Category.fromRawJson(e)),
      );
  }

  Future<bool> _getCategories(QuotesRepository repository) async {
    applyState(ViewState.Busy);
    final categories = await repository.getCategories();
    final jsonList = categories.map<String>((e) => e.toRawJson()).toList();

    bool result = false;
    if (await _save(jsonList)) {
      _categories = categories;
      result = true;
    }
    applyState(ViewState.Idle);
    return result;
  }

  Future<bool> _save(List<String> json) => _sharedPreferences
      .setStringList(AppSharedPref.categories, json)
      .then((value) => value)
      .catchError((_) => false);

  List<Category> _categories;
  List<Category> get categories => _categories;

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
