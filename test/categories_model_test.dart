import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chucknorris_quotes/app/helpers/dependency_assembly.dart';
import 'package:chucknorris_quotes/app/shared/data/viewmodels/categories_model..dart';
import 'package:chucknorris_quotes/constants/app_sharedpref.dart';

import 'mocks/category_mock.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();
    DependencyAssembly.setupDependencyAssembler(sharedPrefs);
    await dependencyAssembler.allReady();
  });

  tearDown(() {
    dependencyAssembler.reset();
  });

  group('Randomize', () {
    test('Should randomize items different', () async {
      final categories = await CategoryMock.categories;
      final jsonList = categories.map<String>((e) => e.toRawJson()).toList();

      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setStringList(AppSharedPref.categories, jsonList);

      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      categoriesViewModel.addListener(() {
        if (!categoriesViewModel.isReady) return;

        final random1 = categoriesViewModel.randomize();
        final random2 = categoriesViewModel.randomize();

        expect(listEquals(random1, random2), false);
      });
    });

    test('Should not allow null on randomize', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomize(size: null),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should not allow negative numbers on randomize', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomize(size: -1),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should return empty', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(categoriesViewModel.randomize().isEmpty, true);
    });

    test('Should not allow negative numbers on randomize', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomize(size: -1),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should return a random index', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      final size = 3;
      categoriesViewModel.addListener(() {
        if (!categoriesViewModel.isReady) return;

        final result = categoriesViewModel.randomize(size: size);
        expect(result.length == size, true);
      });
    });

    test('Should not return duplicate numbers', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      final size = 100;
      final list = categoriesViewModel.randomIndexes(size, size);
      final setIndexes = Set<int>.from(list);
      expect(setIndexes.length == size, true);
    });
  });

  group('Randomize indexes', () {
    test('Should not allow null size on randomIndexes', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomIndexes(null, 1),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should not allow null max number on randomIndexes', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomIndexes(1, null),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should not allow negative size on randomIndexes', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomIndexes(-1, 1),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should not allow negative max number on randomIndexes', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomIndexes(1, -1),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should not allow size bigger than max numbers on randomIndexes',
        () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      expect(
        () => categoriesViewModel.randomIndexes(2, 1),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should return a random index', () async {
      final categoriesViewModel =
          dependencyAssembler.get<CategoriesViewModel>();
      final size = 3;
      final result = categoriesViewModel.randomIndexes(size, 10);
      expect(result.length == size, true);
    });
  });

  test('Should not allow change objects', () async {
    final cacheViewModel = dependencyAssembler.get<CategoriesViewModel>();
    expect(
      () => cacheViewModel.categories.add(CategoryMock.singleCategory),
      throwsA(isInstanceOf<UnsupportedError>()),
    );
  });
}
