
### StatelessWidget

1、Widget
```
//传入widget自己，生成Element
@override
StatelessElement createElement() => StatelessElement(this);
```

2、Element
```
//Element调用widget的build方法
Widget build() => widget.build(this);
```

### StatefulWidget
为什么build要放在state中？
1、方便使用state中的变量
2、使StatefulWidget 有刷新边界？，因为widget是不变的，state也不变，变的只是state的build方法？

/*
* StatelessWidget extends Widget
*
* StatefulWidget extends Widget
*
* Widget extends DiagnosticableTree
*
* DiagnosticableTree with Diagnosticable
*
* mixin Diagnosticable
* */

/*
* class StatelessElement extends ComponentElement
*
* Element extends DiagnosticableTree implements BuildContext
*
* abstract class BuildContext
* */

/*
* abstract class RenderObject extends AbstractNode with DiagnosticableTreeMixin implements HitTestTarget
* */