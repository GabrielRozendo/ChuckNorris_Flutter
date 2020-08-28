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

  group('Past Searches', () {
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

    test('Should not allow null on Update item', () {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      expect(
        () => pastSearchesVM.updateItem(null),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should return false if doenst have the item in cache', () async {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      final result =
          await pastSearchesVM.updateItem(SearchResultMock.singleSearchResult);
      expect(result, false);
    });
  });

  group('Sort', () {
    test('Should sort return empty on empty history', () {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      expect(
        pastSearchesVM.history.isEmpty && pastSearchesVM.sortHistory.isEmpty,
        true,
      );
    });

    test('Should sort by datetime desc', () {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      //FIXME: AddListener is not working :(
      pastSearchesVM.addListener(() {
        if (!pastSearchesVM.isReady) return;

        final searchOld = SearchResultMock.listSearchResult.first;
        searchOld.dateTime = DateTime.now().subtract(Duration(minutes: 1));
        pastSearchesVM.addItem(searchOld);
        final searchNow = SearchResultMock.listSearchResult.last;
        searchNow.dateTime = DateTime.now();
        pastSearchesVM.addItem(searchNow);

        final sort = pastSearchesVM.sortHistory;
        expect(sort.first == searchNow && sort.last == searchOld, true);
      });
    });
  });

  group('Get From Cache', () {
    test('Should get from cache', () async {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      final searchResultMock = SearchResultMock.singleSearchResult;
      await pastSearchesVM.addItem(searchResultMock);
      expect(pastSearchesVM.getFromCache(searchResultMock.term) != null, true);
    });

    test('Should not allow get from cache null parameter', () async {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      expect(
        () => pastSearchesVM.getFromCache(null),
        throwsA(isInstanceOf<ArgumentError>()),
      );
    });

    test('Should return null', () async {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      expect(pastSearchesVM.getFromCache('') == null, true);
    });

    test('Should update the datetime on each search', () async {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      final searchResultMock = SearchResultMock.singleSearchResult;
      await pastSearchesVM.addItem(searchResultMock);
      final now = DateTime.now().subtract(Duration(seconds: 1));
      final cache = pastSearchesVM.getFromCache(searchResultMock.term);
      expect(cache.dateTime.isAfter(now), true);
    });

    test('Should update the datetime', () async {
      final pastSearchesVM = dependencyAssembler.get<PastSearchesViewModel>();
      final searchResultMock = SearchResultMock.singleSearchResult;
      await pastSearchesVM.addItem(searchResultMock);
      final now = DateTime.now();
      final result = await pastSearchesVM.updateItem(searchResultMock);
      expect(result, true);
      final cache = pastSearchesVM.getFromCache(searchResultMock.term);
      expect(cache.dateTime.isAfter(now), true);
    });
  });
}
