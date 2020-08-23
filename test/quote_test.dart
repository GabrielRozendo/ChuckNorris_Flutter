import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:chucknorris_quotes/app/shared/data/models/quote.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/quote_mock.dart';

void main() {
  test('Raw should work', () {
    final rawJson = QuoteMock.singleQuote.toRawJson();
    expect(QuoteMock.singleQuote, Quote.fromRawJson(rawJson));
  });

  test('Should have one category', () async {
    final quote = await QuoteMock.singleCategorized;
    final isSingleCategory = quote.categories.length == 1;
    expect(isSingleCategory, true);
  });

  test('Should have default category', () async {
    final quote = await QuoteMock.noCategorized;
    final isOnlyDefaultCategory = quote.categories.length == 1 &&
        quote.categories.first == Category.defaultCategory();
    expect(isOnlyDefaultCategory, true);
  });

  test('Should have a multiples categories', () async {
    final quote = await QuoteMock.multipleCategorized;
    final isMultiplesCategories = quote.categories.length > 1;
    expect(isMultiplesCategories, true);
  });
}
