
import 'package:flutter/cupertino.dart';

//ComponentElement 是一个抽象类
class WEStatelessElement extends ComponentElement {
  //构造方法,传入一个widget，并把这个widget传给ComponentElement
  WEStatelessElement(WEStatelessWidget widget) : super(widget);

  //实现build接口把widget传给ComponentElement
  @override
  Widget build() {
    return this.widget;
  }

}

abstract class WEStatelessWidget extends Widget {

}

class TestLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

