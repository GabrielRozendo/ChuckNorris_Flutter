import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chucknorris_quotes/app/helpers/dependency_assembly.dart';
import 'package:chucknorris_quotes/app/shared/data/models/search_result.dart';
import 'package:chucknorris_quotes/app/shared/data/viewmodels/past_searches_model.dart';
import 'package:chucknorris_quotes/constants/app_sharedpref.dart';

import 'mocks/search_result_mock.dart';

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

  test('Should not allow add one item directly', () async {
    final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();

    expect(
      () => pastSearchesVM.history.add(SearchResultMock.singleSearchResult),
      throwsA(isInstanceOf<UnsupportedError>()),
    );
  });

  test('Should add one item', () async {
    final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();

    final result =
        await pastSearchesVM.addItem(SearchResultMock.singleSearchResult);

    final isAdded = result &&
        pastSearchesVM.history.length == 1 &&
        pastSearchesVM.history.first == SearchResultMock.singleSearchResult;
    expect(isAdded, true);
  });

  test('Should not add duplicate item', () async {
    final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
    await pastSearchesVM.addItem(SearchResultMock.singleSearchResult);
    await pastSearchesVM.addItem(SearchResultMock.singleSearchResult);

    expect(pastSearchesVM.history.length == 1, true);
  });

  test('Should clear all history', () async {
    final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();

    await pastSearchesVM.addItem(SearchResultMock.singleSearchResult);
    await pastSearchesVM.clear();
    expect(pastSearchesVM.history.isEmpty, true);
  });

  test('Should be not initialize as null', () async {
    final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
    expect(pastSearchesVM.history == null, false);
  });

  test('Should save one item', () async {
    final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
    await pastSearchesVM.addItem(SearchResultMock.singleSearchResult);

    final sharedPrefs = await SharedPreferences.getInstance();
    final savedList = sharedPrefs.getStringList(AppSharedPref.pastSearches);

    final isValid = pastSearchesVM.history.length == 1 &&
        pastSearchesVM.history.first == SearchResultMock.singleSearchResult &&
        savedList.length == 1 &&
        SearchResult.fromRawJson(savedList.first) ==
            SearchResultMock.singleSearchResult;
    expect(isValid, true);
  });
}
