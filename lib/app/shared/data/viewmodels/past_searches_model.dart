import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';
import '../models/search_result.dart';
import '../../../helpers/dependency_assembly.dart';
import '../../../helpers/enum/view_state.dart';
import '../../../../constants/app_sharedpref.dart';

class PastSearchesViewModel extends BaseViewModel {
  PastSearchesViewModel() {
    _populate();
  }

  final _sharedPrefs = dependencyAssembler.get<SharedPreferences>();
  Set<SearchResult> _history;
  UnmodifiableListView<SearchResult> get history =>
      UnmodifiableListView(_history);

  void _populate() {
    final list = _sharedPrefs.getStringList(AppSharedPref.pastSearches) ?? [];
    final searchResultList = list.map((e) => SearchResult.fromRawJson(e));
    _history = Set<SearchResult>.from(searchResultList);
  }

  Future<bool> _save(List<String> json) async {
    return _sharedPrefs
        .setStringList(AppSharedPref.pastSearches, json)
        .then((value) => value)
        .catchError((_) => false);
  }

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
