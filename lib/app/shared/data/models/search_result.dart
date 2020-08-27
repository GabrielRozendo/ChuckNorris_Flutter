import 'dart:convert';
import 'quote.dart';

class SearchResultFields {
  SearchResultFields._();

  static const String term = 'term';
  static const String dateTime = 'dateTime';
  static const String result = 'result';
}

class SearchResult extends Comparable {
  SearchResult({this.term, this.dateTime, this.result});

  final String term;
  DateTime dateTime;
  final List<Quote> result;

  factory SearchResult.fromRawJson(String str) =>
      SearchResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      term: json[SearchResultFields.term],
      dateTime: DateTime.parse(json[SearchResultFields.dateTime]),
      result: List<Quote>.from(
        json[SearchResultFields.result].map((x) => Quote.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SearchResultFields.term: term,
      SearchResultFields.dateTime: dateTime.toIso8601String(),
      SearchResultFields.result: List<Map>.from(
        result.map((x) => x.toJson()),
      ),
    };
  }

  @override
  int compareTo(other) {
    if (this.dateTime != null &&
        other != null &&
        other is SearchResult &&
        other.dateTime != null) {
      if (this.dateTime.isAtSameMomentAs(other.dateTime)) return 0;
      if (this.dateTime.isBefore(other.dateTime)) return -1;
      if (this.dateTime.isAfter(other.dateTime)) return 1;
    }
    return null;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchResult &&
            runtimeType == other.runtimeType &&
            term == other.term;
  }

  @override
  int get hashCode => term.hashCode;
}
