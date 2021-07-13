import 'package:flutter/material.dart';

class StateFullWidget extends StatefulWidget {
  @override
  _StateFullWidgetState createState() {
    print("StateFullWidget ---createState");
    return _StateFullWidgetState();
  }
}

class _StateFullWidgetState extends State<StateFullWidget> {
  var _select = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("StateFullWidget ---initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("StateFullWidget ---didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("StateFullWidget ---build");

    return Container(
      height: 45,
      child: Row(
        children: [
          Text(_select ? "已收藏" : "未收藏"),
          Expanded(child: Container()),
          ElevatedButton(
            child: Text("收藏"),
            onPressed: (){
              setState(() {
                _select = !_select;
              });
            },
          )
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StateFullWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("StateFullWidget ---didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("StateFullWidget ---deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("StateFullWidget ---dispose");
  }

  _temp() {
    setState(() {});
  }
}
