import 'package:chucknorris_quotes/app/shared/data/models/search_result.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/search_result_mock.dart';

void main() {
  test('from raw json should works', () {
    final rawJson = SearchResultMock.singleSearchResult.toRawJson();
    expect(
      SearchResultMock.singleSearchResult,
      SearchResult.fromRawJson(rawJson),
    );
  });

  test('should return values', () async {
    final searchResult = await SearchResultMock.futureSearchResult('term');
    expect(searchResult.result.isNotEmpty, true);
  });

  test('term should be the same', () async {
    final term = 'search term';
    final searchResult = await SearchResultMock.futureSearchResult(term);
    expect(searchResult.term, term);
  });

  test('should be empty', () async {
    final searchResult = await SearchResultMock.futureSearchNoResult('');
    expect(searchResult.result.isEmpty, true);
  });

  test('should not duplicate', () {
    final setSearchResult = Set<SearchResult>.from([
      SearchResultMock.singleSearchResult,
      SearchResultMock.singleSearchResult,
    ]);
    expect(setSearchResult.length, 1);
  });

  test('should sort by date', () {
    final searchResult = SearchResult(
      result: SearchResultMock.singleSearchResult.result,
      term: 'sort by date',
      dateTime: SearchResultMock.singleSearchResult.dateTime.add(
        Duration(seconds: 1),
      ),
    );

    final list = List<SearchResult>.from([
      searchResult,
      SearchResultMock.singleSearchResult,
    ])
      ..sort();
    expect(list.last == searchResult, true);
  });
}

// await dependencyAssembler.allReady();
// final pastSearches = dependencyAssembler.get<PastSearchesViewModel>();
