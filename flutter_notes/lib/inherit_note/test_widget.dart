import 'package:flutter/material.dart';
import 'share_data_widget.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  @override
  Widget build(BuildContext context) {
    print("TestWidget build");
    return Container(
      child: Text(
        ShareDataWidget.of(context).shareData.toString(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("TestWidget didChangeDependencies");
  }

}
