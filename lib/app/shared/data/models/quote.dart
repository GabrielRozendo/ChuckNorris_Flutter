// https://app.quicktype.io/

// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

import 'category.dart';

class Quote {
  Quote({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  final List<String> categories;
  final DateTime createdAt;
  final String iconUrl;
  final String id;
  final DateTime updatedAt;
  final String url;
  final String value;

  factory Quote.fromRawJson(String str) => Quote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        categories: List<String>.from(json['categories'].map((x) => x)),
        createdAt: DateTime.parse(json['created_at']),
        iconUrl: json['icon_url'],
        id: json['id'],
        updatedAt: DateTime.parse(json['updated_at']),
        url: json['url'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'categories': List<Category>.from(categories.map((x) => x)),
        'created_at': createdAt.toIso8601String(),
        'icon_url': iconUrl,
        'id': id,
        'updated_at': updatedAt.toIso8601String(),
        'url': url,
        'value': value,
      };
}
