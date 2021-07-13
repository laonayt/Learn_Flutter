import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  @override
  _TempPageState createState() {
    print("Page-createState");
    return _TempPageState();
  }

}

class _TempPageState extends State<TempPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Page-initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Page-didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("Page-build");

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            child: Text("点击"),
            onPressed: (){
              setState(() {});
            }
          ),
        ],
      ),
      body: Container(),
    );
  }

  @override
  void didUpdateWidget(covariant TempPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Page-didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Page-deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Page-dispose");
  }

}
