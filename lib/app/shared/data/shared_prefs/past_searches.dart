import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/app_sharedpref.dart';

class PastSearches {
  PastSearches._() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      _list = sharedPrefs.getStringList(AppSharedPref.pastSearches) ??
          List<String>();
    });
  }
  static final _pastSearches = PastSearches._();
  factory PastSearches() => _pastSearches;

  List<String> _list;
  List<String> get list => _list;

  Future<bool> _save() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.setStringList(
      AppSharedPref.pastSearches,
      _list,
    );
  }

  Future<bool> clear() async {
    _list.clear();
    return _save();
  }

  Future<bool> addItem(String str) async {
    _list.add(str);
    return _save();
  }

  Future<bool> removeFav(String str) async {
    _list.remove(str);
    return _save();
  }
}
