import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';
import '../../../helpers/dependency_assembly.dart';
import '../../../helpers/enum/view_state.dart';
import '../../../../constants/app_sharedpref.dart';

class SharedPrefsSettings extends BaseViewModel {
  SharedPrefsSettings() {
    _populate();
  }

  final _sharedPrefs = dependencyAssembler.get<SharedPreferences>();
  bool _hasAlreadySearched;
  bool get hasAlreadySearch => _hasAlreadySearched;
  set hasAlreadySearch(bool value) {
    ArgumentError.checkNotNull(value, 'value');

    _sharedPrefs.setBool(AppSharedPref.hasAlreadySearched, value);
    _hasAlreadySearched = value;
  }

  void _populate() async {
    applyState(ViewState.Busy);

    _hasAlreadySearched =
        _sharedPrefs.getBool(AppSharedPref.hasAlreadySearched) ?? false;

    applyState(ViewState.Idle);
  }
}
