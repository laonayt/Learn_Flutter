import 'package:flutter/cupertino.dart';
import 'view_state.dart';

class BaseViewModel extends ChangeNotifier {

  Api api;
  bool disposed = false;

  BaseViewModel({@required Api api}) : api = api;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

}

class Api {

}