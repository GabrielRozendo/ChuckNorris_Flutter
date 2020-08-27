import 'package:flutter_test/flutter_test.dart';

import 'package:chucknorris_quotes/app/shared/data/viewmodels/shared_prefs.dart';

class PrefSharedsMock implements SharedPrefsViewModelProtocol {
  @override
  List<String> getStringList(String key) => [];

  @override
  Future<bool> setStringList(String key, List<String> value) {
    // value.forEach((e) => debugPrint(e));
    return Future.delayed(Duration(seconds: 1), () => true);
  }

  @override
  bool getBool(String key) => true;

  @override
  Future<bool> setBool(String key, bool value) {
    return Future.delayed(Duration(seconds: 1), () => true);
  }
}

class PrefSharedsErrorMock implements SharedPrefsViewModelProtocol {
  @override
  List<String> getStringList(String key) => null;

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return Future.delayed(Duration(seconds: 1), () => throw Exception('mock'));
  }

  @override
  bool getBool(String key) => null;

  @override
  Future<bool> setBool(String key, bool value) {
    return Future.delayed(Duration(seconds: 1), () => throw Exception('mock'));
  }
}
