import '../../../../../constants/app_settings.dart';

class QuotesEndpoints {
  QuotesEndpoints._();

  static String get baseUrl => AppSettings.baseUrl;

  static String get random => 'random';
  static String get categories => 'categories';
  static String search(String term) => 'search?query=$term';
}
