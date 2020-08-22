import 'dart:convert';

class Category {
  Category({
    this.name,
  });

  final String name;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
