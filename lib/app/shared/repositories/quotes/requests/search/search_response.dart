import '../../../../data/models/search_result.dart';
import '../../../../network/network_mappers.dart';

class QuotesSearchResponse extends BaseMapable {
  SearchResult searchResult;
  DateTime dateTime;
  String term;
  QuotesSearchResponse(this.term, {this.dateTime}) {
    if (dateTime == null) dateTime = DateTime.now();
  }

  @override
  Mapable fromJson(Map<String, dynamic> json) {
    json.addEntries([
      MapEntry(SearchResultFields.term, term),
      MapEntry(SearchResultFields.dateTime, dateTime.toIso8601String()),
    ]);
    searchResult = SearchResult.fromJson(json);
    return this;
  }
}
