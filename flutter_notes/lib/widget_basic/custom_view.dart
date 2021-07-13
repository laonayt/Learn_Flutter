import 'package:flutter/material.dart';

/*
* StatelessWidget/StatefulWidget ->Widget
* Element createElement() {
    return HomeElement(this);
  }
  *
  * StatelessElement/StatefulElement ->ComponentElement->Element
* */

class CustomWidget extends Widget {
  @override
  Element createElement() {
    print("createElement");
    return CustomElement(this);
  }
}

class CustomElement extends ComponentElement {
  CustomElement(Widget widget) : super(widget);

  String text = "123456789";
  @override
  Widget build() {
    print("CustomElement-build");

    return Container();

    return InkWell(
      child: Text(text),
      onTap: (){
        var t = text.split("")..shuffle();
        text = t.join();
        markNeedsBuild(); //点击后将该Element标记为dirty，Element将会rebuild
      },
    );
  }

}

// class AAA1 extends RenderObjectWidget {
//   @override
//   RenderObjectElement createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     // TODO: implement createRenderObject
//     throw UnimplementedError();
//   }
//
// }

// class BBB extends Element {
//   BBB(Widget widget) : super(widget);
//
//   @override
//   // TODO: implement debugDoingBuild
//   bool get debugDoingBuild => throw UnimplementedError();
//
//   @override
//   void performRebuild() {
//     // TODO: implement performRebuild
//   }
//
// }
//
// class BBB1 extends RenderObjectElement {
//
// }