import 'dart:convert';
import 'dart:io';

import 'package:chucknorris_quotes/app/shared/data/models/search_result.dart';
import 'package:chucknorris_quotes/app/shared/repositories/quotes/requests/search/search_response.dart';

import 'mock_files.dart';
import 'quote_mock.dart';

class SearchResultMock {
  static SearchResult get singleSearchResult => SearchResult(
        dateTime: QuoteMock.fakeDate,
        term: 'term',
        result: QuoteMock.multipleQuotes,
      );

  static Set<SearchResult> get listSearchResult => Set<SearchResult>.from(
        [
          singleSearchResult,
          SearchResult(
            dateTime: QuoteMock.fakeDate,
            term: 'term2',
            result: QuoteMock.multipleQuotes,
          ),
        ],
      );

  static Future<SearchResult> futureSearchResult(String term) async {
    final file = File(MockFiles.SearchFace.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesSearchResponse(term)..fromJson(json);
    return response.searchResult;
  }

  static Future<SearchResult> futureSearchNoResult(String term) async {
    final file = File(MockFiles.SearchNoResult.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesSearchResponse(term)..fromJson(json);
    return response.searchResult;
  }
}
