import 'package:chucknorris_quotes/app/helpers/dependency_assembly.dart';
import 'package:chucknorris_quotes/app/shared/data/models/search_result.dart';
import 'package:chucknorris_quotes/app/shared/data/viewmodels/past_searches_model.dart';
import 'package:chucknorris_quotes/constants/app_sharedpref.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mocks/prefs_shared.dart';
import 'mocks/search_result_mock.dart';

void main() {
  test('History should not be null', () async {
    final prefSharedsMock = PrefSharedsMock();

    final pastSearches = PastSearchesViewModel(
      prefSharedsMock,
      SearchResultMock.listSearchResult,
    );
    final isNull = pastSearches.history == null;
    expect(isNull, false);
  });

  test('Should be not accept a null pref shared', () {
    expect(
      () => PastSearchesViewModel(null, SearchResultMock.listSearchResult),
      throwsAssertionError,
    );
  });

  test('Should be not accept a null list', () {
    expect(
      () => PastSearchesViewModel(PrefSharedsMock(), null),
      throwsAssertionError,
    );
  });

  test('Should be not update/save when there is an error on shared pref',
      () async {
    final prefSharedsErrorMock = PrefSharedsErrorMock();
    final pastSearchesViewModel =
        PastSearchesViewModel(prefSharedsErrorMock, Set<SearchResult>());

    final result = await pastSearchesViewModel
        .addItem(SearchResultMock.singleSearchResult);

    final isEmpty = !result && pastSearchesViewModel.history.isEmpty;
    expect(isEmpty, true);
  });

  test('Should be not update/save when there is an error on shared pref',
      () async {
    final prefSharedsErrorMock = PrefSharedsErrorMock();
    final pastSearchesViewModel = PastSearchesViewModel(
      prefSharedsErrorMock,
      Set.of([SearchResultMock.singleSearchResult]),
    );

    final result = await pastSearchesViewModel.clear();

    final isNotEmpty = !result && pastSearchesViewModel.history.length == 1;
    expect(isNotEmpty, true);
  });

  test('Should add one item', () async {
    final prefSharedsMock = PrefSharedsMock();
    final pastSearchesViewModel =
        PastSearchesViewModel(prefSharedsMock, Set.of([]));

    final result = await pastSearchesViewModel
        .addItem(SearchResultMock.singleSearchResult);

    final isAdded = result &&
        pastSearchesViewModel.history.length == 1 &&
        pastSearchesViewModel.history.first ==
            SearchResultMock.singleSearchResult;
    expect(isAdded, true);
  });

  test('Should not add duplicate item', () async {
    final prefSharedsMock = PrefSharedsMock();
    final pastSearchesViewModel = PastSearchesViewModel(
      prefSharedsMock,
      Set.of([SearchResultMock.singleSearchResult]),
    );

    await pastSearchesViewModel.addItem(SearchResultMock.singleSearchResult);

    final hasOne = pastSearchesViewModel.history.length == 1;
    expect(hasOne, true);
  });

  test('Should clear all history', () async {
    final prefSharedsMock = PrefSharedsMock();
    final pastSearchesViewModel = PastSearchesViewModel(
      prefSharedsMock,
      Set.of([SearchResultMock.singleSearchResult]),
    );

    await pastSearchesViewModel.addItem(SearchResultMock.singleSearchResult);
    await pastSearchesViewModel.clear();
    expect(pastSearchesViewModel.history.isEmpty, true);
  });

  SharedPreferences sharedPreferences;
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    DependencyAssembly.setupDependencyAssembler(sharedPreferences);
    await dependencyAssembler.allReady();
  });

  test('Should be not initialize as null', () async {
    final pastSearchesViewModel =
        dependencyAssembler.get<PastSearchesViewModel>();
    expect(pastSearchesViewModel.history == null, false);
  });

  test('Should save one item', () async {
    final pastSearchesViewModel =
        dependencyAssembler.get<PastSearchesViewModel>();
    await pastSearchesViewModel.addItem(SearchResultMock.singleSearchResult);

    final savedList =
        sharedPreferences.getStringList(AppSharedPref.pastSearches);

    final isValid = pastSearchesViewModel.history.length == 1 &&
        pastSearchesViewModel.history.first ==
            SearchResultMock.singleSearchResult &&
        savedList.length == 1 &&
        SearchResult.fromRawJson(savedList.first) ==
            SearchResultMock.singleSearchResult;
    expect(isValid, true);
  });
}
