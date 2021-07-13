import 'package:flutter/material.dart';
import 'custom_view.dart';

class BottomNotePage extends StatefulWidget {
  @override
  _BottomNotePageState createState() => _BottomNotePageState();
}

class _BottomNotePageState extends State<BottomNotePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_BottomNotePageState-initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("_BottomNotePageState-didChangeDependencies");
  }


  @override
  Widget build(BuildContext context) {
    print("_BottomNotePageState-build");

    return Scaffold(
      appBar: AppBar(
        title: Text("底层原理"),
      ),
      body: Container(
        child: Column(
          children: [
            // CustomWidget(),
            // CustomWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant BottomNotePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("_BottomNotePageState-didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("_BottomNotePageState ---deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("_BottomNotePageState ---dispose");
  }


}
