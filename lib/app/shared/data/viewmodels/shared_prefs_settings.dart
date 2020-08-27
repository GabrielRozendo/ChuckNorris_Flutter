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

  bool _hasAlreadySearched;
  bool get hasAlreadySearch => _hasAlreadySearched;
  set hasAlreadySearch(bool value) {
    _sharedPreferences.setBool(AppSharedPref.hasAlreadySearched, value);
    _hasAlreadySearched = value;
  }

  void _populate() async {
    applyState(ViewState.Busy);

    _hasAlreadySearched =
        _sharedPreferences.getBool(AppSharedPref.hasAlreadySearched) ?? false;

    applyState(ViewState.Idle);
  }
}
