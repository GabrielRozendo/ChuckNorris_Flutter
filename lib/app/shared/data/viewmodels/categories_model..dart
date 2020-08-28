import 'dart:collection';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';
import '../models/category.dart';
import '../../repositories/quotes/quotes_repository.dart';
import '../../../helpers/dependency_assembly.dart';
import '../../../helpers/enum/view_state.dart';
import '../../../../constants/app_sharedpref.dart';
import '../../../../constants/app_settings.dart';

class CategoriesViewModel extends BaseViewModel {
  CategoriesViewModel() {
    _populate();
  }

  final _sharedPrefs = dependencyAssembler.get<SharedPreferences>();

  List<Category> _categories;
  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);

  void _populate() async {
    applyState(ViewState.Busy);
    final repository = dependencyAssembler.get<QuotesRepository>();

    final list = _sharedPrefs.getStringList(AppSharedPref.categories);
    if (list == null)
      _categories = await _fetchCategories(repository);
    else
      _categories = _getCategoriesSaved(list);

    applyState(ViewState.Idle);
  }

  List<Category> _getCategoriesSaved(List<String> list) {
    return List<Category>.from(
      list.map((e) => Category.fromRawJson(e)),
    );
  }

  Future<List<Category>> _fetchCategories(QuotesRepository repository) async {
    final categories = await repository.fetchCategories();
    final jsonList = categories.map<String>((e) => e.toRawJson()).toList();

    if (await _save(jsonList)) return categories;
    return [];
  }

  Future<bool> _save(List<String> json) {
    return _sharedPrefs
        .setStringList(AppSharedPref.categories, json)
        .then((value) => value)
        .catchError((_) => false);
  }

  List<int> randomIndexes(int size, int maxNumber) {
    ArgumentError.checkNotNull(size, 'size');
    ArgumentError.checkNotNull(maxNumber, 'maxNumber');

    if (size <= 0) throw ArgumentError.value(size, 'size', 'Invalid argument');
    if (maxNumber <= 0)
      throw ArgumentError.value(maxNumber, 'maxNumber', 'Invalid argument');

    if (size > maxNumber)
      throw ArgumentError.value(
          size, 'Size must not be bigger than max number');

    final numbers = Set<int>();
    final random = Random();

    while (numbers.length < size) {
      final value = random.nextInt(maxNumber);
      numbers.add(value);
    }

    return numbers.toList();
  }

  List<Category> randomize({int size = AppSettings.maxCategories}) {
    ArgumentError.checkNotNull(size, 'size');
    if (size <= 0) throw ArgumentError.value(size, 'size', 'Invalid argument');

    if (_categories?.isEmpty ?? true) return [];

    final randomIndexesList = randomIndexes(size, _categories.length - 1);
    final randomCategoryList =
        randomIndexesList.map((i) => _categories[i]).toList();
    return randomCategoryList;
  }
}
