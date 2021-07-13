import 'package:flutter/material.dart';

class DiscoverProvider with ChangeNotifier {
  var _count = 0;

  get count {
    return _count;
  }

  addCount() {
    _count++;
    notifyListeners();
  }

}