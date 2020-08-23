import 'package:chucknorris_quotes/constants/app_settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chucknorris_quotes/app/helpers/extensions/string_extension.dart';

import 'mocks/quote_mock.dart';

void main() {
  test('should be a long text', () {
    final str = '*' * AppSettings.longCharacteres;
    expect(str.isLongText, true);
  });

  test('should be a long text', () {
    final str = '*' * (AppSettings.longCharacteres + 1);
    expect(str.isLongText, true);
  });

  test('should be not a long text', () {
    final str = '*' * (AppSettings.longCharacteres - 1);
    expect(str.isLongText, false);
  });

  test('should be a long value', () async {
    final quote = await QuoteMock.longValue;
    expect(quote.value.isLongText, true);
  });

  test('should be a short value', () async {
    final quote = await QuoteMock.shortValue;
    expect(quote.value.isLongText, false);
  });
}
