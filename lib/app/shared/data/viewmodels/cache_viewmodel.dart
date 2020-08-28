import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';
import '../models/quote.dart';
import '../../../helpers/dependency_assembly.dart';
import '../../../helpers/enum/view_state.dart';
import '../../../../constants/app_sharedpref.dart';

class CacheViewModel extends BaseViewModel {
  CacheViewModel() {
    _populate();
  }

  final _sharedPrefs = dependencyAssembler.get<SharedPreferences>();
  Set<Quote> _cachedList;
  UnmodifiableListView<Quote> get cachedList =>
      UnmodifiableListView(_cachedList);

  void _populate() async {
    applyState(ViewState.Busy);

    final savedList = _sharedPrefs.getStringList(AppSharedPref.cache) ?? [];
    _cachedList = Set<Quote>.from(
      savedList.map((e) => Quote.fromRawJson(e)),
    );

    applyState(ViewState.Idle);
  }

  Future<bool> _save(List<String> json) async {
    return _sharedPrefs
        .setStringList(AppSharedPref.cache, json)
        .then((value) => value)
        .catchError((_) => false);
  }

  void _onUpdate() async {
    final jsonList = _cachedList.map<String>((e) => e.toRawJson()).toList();
    _save(jsonList);
  }

  void add(Quote quote) {
    ArgumentError.checkNotNull(quote, 'quote');
    _cachedList.add(quote);
    _onUpdate();
  }

  void addAll(Iterable<Quote> quotes) {
    ArgumentError.checkNotNull(quotes, 'quotes');
    _cachedList.addAll(quotes);
    _onUpdate();
  }

  List<Quote> random(int count) {
    ArgumentError.checkNotNull(count, 'count');
    if (count < 0)
      throw ArgumentError.value(count, 'count', 'Invalid argument');
    else if (count == 0) return [];

    final list = _cachedList.toList()..shuffle();
    return list.take(count).toList();
  }
}
