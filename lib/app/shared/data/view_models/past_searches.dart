import 'package:flutter/foundation.dart';
import '../viewmodels/shared_prefs.dart';
import '../models/search_result.dart';
import '../../../../constants/app_sharedpref.dart';

class PastSearches extends ChangeNotifier {
  final SharedPrefsViewModelProtocol _sharedPreferences;
  PastSearches(this._sharedPreferences, this._history)
      : assert(_sharedPreferences != null, _history != null);

  List<SearchResult> _history;
  List<SearchResult> get history => _history;

  Future<bool> _save(List<String> json) async => _sharedPreferences
          .setStringList(AppSharedPref.pastSearches, json)
          .then((value) => true)
          .catchError((error) {
        debugPrint(error);
        return false;
      });

  Future<bool> clear() async {
    if (await _save([])) {
      _history.clear();
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> addItem(SearchResult searchResult) async {
    final newHistory = _history;
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
