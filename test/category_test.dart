import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:chucknorris_quotes/constants/app_settings.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/category_mock.dart';

void main() {
  test('Raw should work', () {
    final rawJson = Category.defaultCategory().toRawJson();
    expect(Category.defaultCategory(), Category.fromRawJson(rawJson));
  });

  test('Categories from json should work', () async {
    final categories = await CategoryMock.categories;
    expect(categories.isNotEmpty, true);
  });

  test('Default category should be as Settings', () {
    expect(Category.defaultCategory().name, AppSettings.defaultCategory);
  });
}
