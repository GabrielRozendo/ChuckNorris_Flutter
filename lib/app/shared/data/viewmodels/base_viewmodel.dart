import 'package:chucknorris_quotes/app/helpers/enum/view_state.dart';
import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  bool get isReady => _state == ViewState.Idle;

  void applyState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
