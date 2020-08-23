import 'dart:convert';
import '../../../../constants/app_settings.dart';

class Category {
  Category({this.name});

  final String name;

  factory Category.defaultCategory() =>
      Category(name: AppSettings.defaultCategory);

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json['name']);

  Map<String, dynamic> toJson() => {'name': name};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => this.hashCode;
}
