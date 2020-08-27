import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chucknorris_quotes/app/helpers/dependency_assembly.dart';
import 'package:chucknorris_quotes/app/shared/data/viewmodels/categories_model..dart';
import 'package:chucknorris_quotes/app/shared/data/viewmodels/shared_prefs.dart';
import 'package:chucknorris_quotes/app/shared/repositories/quotes/quotes_repository.dart';
import 'package:chucknorris_quotes/constants/app_sharedpref.dart';

import 'mocks/category_mock.dart';

void main() {
  test('Should  not accept a null list && null repository', () {
    expect(
      () => CategoriesViewModel(null, null),
      throwsAssertionError,
    );
  });

  test('Should not accept sharedPrefs null', () {
    expect(
      () => CategoriesViewModel(null, QuotesRepository()),
      throwsAssertionError,
    );
  });

  test('Should not accept repository null', () async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    DependencyAssembly.setupDependencyAssembler(sharedPreferences);
    await dependencyAssembler.allReady();
    final sharedPrefsViewModel =
        dependencyAssembler.get<SharedPrefsViewModelProtocol>();

    expect(
      () => CategoriesViewModel(sharedPrefsViewModel, null),
      throwsAssertionError,
    );
  });

  test('Randomize', () async {
    final categories = await CategoryMock.categories;
    SharedPreferences.setMockInitialValues({});

    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonList = categories.map<String>((e) => e.toRawJson()).toList();
    await sharedPreferences.setStringList(AppSharedPref.categories, jsonList);

    DependencyAssembly.setupDependencyAssembler(sharedPreferences);
    await dependencyAssembler.allReady();

    final categoriesViewModel = dependencyAssembler.get<CategoriesViewModel>();
    final random1 = categoriesViewModel.randomize();
    final random2 = categoriesViewModel.randomize();

    expect(listEquals(random1, random2), false);
  });
}
