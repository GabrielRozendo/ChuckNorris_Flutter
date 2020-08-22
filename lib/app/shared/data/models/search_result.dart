// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

import 'quote.dart';

class SearchResult {
  SearchResult({
    this.total,
    this.result,
  });

  final int total;
  final List<Quote> result;

  factory SearchResult.fromRawJson(String str) =>
      SearchResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        total: json['total'],
        result: List<Quote>.from(json['result'].map((x) => Quote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'result': List<dynamic>.from(result.map((x) => x.toJson())),
      };
}
