import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<dynamic> pushPage(BuildContext context, Widget routePage) {
  var result = Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => routePage));
  return result;
}

void pushAndRemovePage(BuildContext context, Widget routePage) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => routePage),
    (route) => route == null,
  );
}
