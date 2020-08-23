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
        : List<Category>.from(
            json['categories'].map(
              (x) => x is String ? Category(name: x) : Category.fromJson(x),
            ),
          );

    if (categories.isEmpty) categories.add(Category.defaultCategory());
    return categories;
  }

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        categories: _getCategories(json),
        createdAt: DateTime.parse(json['created_at']),
        iconUrl: json['icon_url'],
        id: json['id'],
        updatedAt: DateTime.parse(json['updated_at']),
        url: json['url'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
        'created_at': createdAt.toIso8601String(),
        'icon_url': iconUrl,
        'id': id,
        'updated_at': updatedAt.toIso8601String(),
        'url': url,
        'value': value,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Quote && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
