import 'package:flutter/foundation.dart';
import 'shared_prefs.dart';
import '../models/search_result.dart';
import '../../../../constants/app_sharedpref.dart';

class PastSearchesViewModel extends ChangeNotifier {
  final SharedPrefsViewModelProtocol _sharedPreferences;
  PastSearchesViewModel(this._sharedPreferences, this._history)
      : assert(_sharedPreferences != null && _history != null);

  Set<SearchResult> _history;
  Set<SearchResult> get history => _history;

  Future<bool> _save(List<String> json) async => _sharedPreferences
      .setStringList(AppSharedPref.pastSearches, json)
      .then((value) => value)
      .catchError((_) => false);

  Future<bool> clear() async {
    if (await _save([])) {
      _history.clear();
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> addItem(SearchResult searchResult) async {
    final newHistory = Set.of(_history);
    newHistory.removeWhere((e) => e.term == searchResult.term);
    newHistory.add(searchResult);
    final jsonList = newHistory.map<String>((e) => e.toRawJson()).toList();

    if (await _save(jsonList)) {
      _history = newHistory;
      notifyListeners();
      return true;
    }
    return false;
  }
}
