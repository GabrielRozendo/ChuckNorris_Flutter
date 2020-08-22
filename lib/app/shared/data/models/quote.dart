// https://app.quicktype.io/

// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

import 'category.dart';
import '../../../../constants/app_strings.dart';

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

  final List<Category> categories;
  final DateTime createdAt;
  final String iconUrl;
  final String id;
  final DateTime updatedAt;
  final String url;
  final String value;

  factory Quote.fromRawJson(String str) => Quote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<Category> _getCategories(Map<String, dynamic> json) {
    List<Category> categories = json['categories'] == null
        ? []
        : List<Category>.from(json['categories'].map((x) => x));

    if (categories.isEmpty)
      categories.add(
        Category(name: AppStrings.uncategorized),
      );
    return categories;
  }

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      categories: _getCategories(json),
      createdAt: DateTime.parse(json['created_at']),
      iconUrl: json['icon_url'],
      id: json['id'],
      updatedAt: DateTime.parse(json['updated_at']),
      url: json['url'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'categories': List<Category>.from(categories.map((x) => x.toJson())),
        'created_at': createdAt.toIso8601String(),
        'icon_url': iconUrl,
        'id': id,
        'updated_at': updatedAt.toIso8601String(),
        'url': url,
        'value': value,
      };
}
