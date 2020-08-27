import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsViewModelProtocol {
  bool getBool(String key);
  Future<bool> setBool(String key, bool value);
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

  @override
  bool getBool(String key) => sharedPreferences.getBool(key);

  @override
  Future<bool> setBool(String key, bool value) =>
      sharedPreferences.setBool(key, value);
}
