import 'package:flutter/foundation.dart';

import '../../../helpers/enum/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  bool get isReady => _state == ViewState.Idle;

  void applyState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
