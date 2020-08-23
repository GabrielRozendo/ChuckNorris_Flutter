import 'package:chucknorris_quotes/constants/app_settings.dart';

extension StringExtension on String {
  bool get isLongText => this.length >= AppSettings.longCharacteres;
}
