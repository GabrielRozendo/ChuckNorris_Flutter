import 'dart:convert';
import 'dart:io';

import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:chucknorris_quotes/app/shared/repositories/quotes/requests/categories/categories_response.dart';

import 'mock_files.dart';

class CategoryMock {
  static Future<List<Category>> get categories async {
    final file = File(MockFiles.Categories.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesCategoriesResponse()..fromJsonList(json);
    return response.categories;
  }

  static Category get singleCategory => Category(name: 'category');
}
