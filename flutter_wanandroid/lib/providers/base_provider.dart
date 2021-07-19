import 'package:flutter/cupertino.dart';

enum ViewState {
  busy,
  empty,
  error,
  finish,
}

class BaseProvier extends ChangeNotifier {
  //页面状态
  ViewState _viewState = ViewState.busy;

  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewState = viewState;
    print("projectPage: 通知刷新 begin");
    notifyListeners();
    print("projectPage: 通知刷新 end");
  }

  //
}
