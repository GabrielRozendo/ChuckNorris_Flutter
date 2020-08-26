import 'package:chucknorris_quotes/app/helpers/enum/view_state.dart';

import 'base_viewmodel.dart';
import 'shared_prefs.dart';
import '../models/search_result.dart';
import '../../../../constants/app_sharedpref.dart';

class PastSearchesViewModel extends BaseViewModel {
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
    bool result = false;
    if (await _save([])) {
      _history.clear();
      result = true;
    }
    applyState(ViewState.Idle);
    return result;
  }

  SearchResult getFromCache(String term) {
    final item = _history.singleWhere((e) => e.term == term, orElse: null);
    if (item != null) updateItem(item);
    return item;
  }

  Future<bool> addItem(SearchResult searchResult) async {
    applyState(ViewState.Busy);
    final newHistory = Set.of(_history);
    newHistory.removeWhere((e) => e.term == searchResult.term);
    newHistory.add(searchResult);
    final jsonList = newHistory.map<String>((e) => e.toRawJson()).toList();

    bool result = false;
    if (await _save(jsonList)) {
      _history = newHistory;
      result = true;
    }
    applyState(ViewState.Idle);
    return result;
  }

  Future<bool> updateItem(SearchResult searchResult) async {
    applyState(ViewState.Busy);
    final newHistory = Set.of(_history);
    SearchResult existentItem = newHistory.singleWhere(
      (e) => e.term == searchResult.term,
      orElse: null,
    );
    if (existentItem == null) return false;
    searchResult.dateTime = DateTime.now();
    existentItem = searchResult;
    final jsonList = newHistory.map<String>((e) => e.toRawJson()).toList();

    bool result = false;
    if (await _save(jsonList)) {
      _history = newHistory;
      result = true;
    }
    applyState(ViewState.Idle);
    return result;
  }

  List<SearchResult> get sortHistory {
    final list = _history.toList();
    list.sort();
    return list.reversed.toList();
  }
}
