import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chucknorris_quotes/app/helpers/dependency_assembly.dart';
import 'package:chucknorris_quotes/app/shared/data/viewmodels/cache_viewmodel.dart';
import 'package:chucknorris_quotes/constants/app_sharedpref.dart';

import 'mocks/quote_mock.dart';

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

  test('Should save them local', () async {
    final cacheViewModel = dependencyAssembler.get<CacheViewModel>();
    cacheViewModel.add(QuoteMock.singleQuote);
    final sharedPrefs = await SharedPreferences.getInstance();
    final list = sharedPrefs.getStringList(AppSharedPref.cache);
    expect(list.isNotEmpty, true);
  });

  test('Should return randomize values', () async {
    final cacheViewModel = dependencyAssembler.get<CacheViewModel>();
    final size = 10;
    cacheViewModel.addAll(QuoteMock.multipleQuotes(size: size));
    final list1 = cacheViewModel.random(size);
    final list2 = cacheViewModel.random(size);
    expect(listEquals(list1, list2), false);
  });

  test('Should not raise an exception if the count is bigger than list', () {
    final cacheViewModel = dependencyAssembler.get<CacheViewModel>();
    cacheViewModel.add(QuoteMock.singleQuote);
    final list = cacheViewModel.random(2);
    expect(list.length == 1, true);
  });

  test('Should load from shared', () async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final quotes = QuoteMock.multipleQuotes();

    sharedPrefs.setStringList(
      AppSharedPref.cache,
      quotes.map((e) => e.toRawJson()).toList(),
    );

    final cacheViewModel = dependencyAssembler.get<CacheViewModel>();
    expect(cacheViewModel.cachedList.isNotEmpty, true);
  });

  test('Should not allow change objects', () async {
    final cacheViewModel = dependencyAssembler.get<CacheViewModel>();
    expect(
      () => cacheViewModel.cachedList.add(QuoteMock.singleQuote),
      throwsA(isInstanceOf<UnsupportedError>()),
    );
  });
}
