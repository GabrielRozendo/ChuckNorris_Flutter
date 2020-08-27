import 'base_viewmodel.dart';
import 'shared_prefs.dart';
import '../../../helpers/enum/view_state.dart';
import '../../../../constants/app_sharedpref.dart';

class SharedPrefsSettings extends BaseViewModel {
  final SharedPrefsViewModelProtocol _sharedPreferences;
  SharedPrefsSettings(this._sharedPreferences)
      : assert(_sharedPreferences != null) {
    _populate();
  }

  bool _hasAlreadySearch;
  bool get hasAlreadySearch => _hasAlreadySearch;
  set hasAlreadySearch(bool value) {
    _sharedPreferences.setBool(AppSharedPref.hasAlreadySearched, value);
    _hasAlreadySearch = value;
  }

  void _populate() async {
    applyState(ViewState.Busy);

    _hasAlreadySearch =
        _sharedPreferences.getBool(AppSharedPref.hasAlreadySearched) ?? false;

    applyState(ViewState.Idle);
  }
}
