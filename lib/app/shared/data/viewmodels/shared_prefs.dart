import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsViewModelProtocol {
  List<String> getStringList(String key);
  Future<bool> setStringList(String key, List<String> value);
}

class SharedPrefsViewModel implements SharedPrefsViewModelProtocol {
  final SharedPreferences sharedPreferences;
  SharedPrefsViewModel(this.sharedPreferences);

  @override
  List<String> getStringList(String key) =>
      sharedPreferences.getStringList(key);

  @override
  Future<bool> setStringList(String key, List<String> value) =>
      sharedPreferences.setStringList(key, value);
}
