import 'package:flutter/material.dart';
import 'statefull_widget.dart';
import 'package:flutter_notes/utils/screen.dart';

class StatefullNotePage extends StatefulWidget {
  final String nameStr;
  StatefullNotePage(this.nameStr);

  @override
  _StatefullNotePageState createState(){
    print("StatefullNotePage ---createState");
    return _StatefullNotePageState();
  }

}

class _StatefullNotePageState extends State<StatefullNotePage> with WidgetsBindingObserver{
  var _dataArray = [1,2,3,4];
  var _isTemp = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //添加生命周期监听
    WidgetsBinding.instance.addObserver(this);
    print("StatefullNotePage ---initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("StatefullNotePage ---didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("StatefullNotePage ---build");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameStr),//和stateless的区别
        actions: [
          ElevatedButton(
            child: Text("点击"),
            onPressed: (){
              setState(() {
                _isTemp = !_isTemp;
              });
            },
          ),
        ],
      ),
      body: _isTemp ? Container(
        width: Screen.width,
        height: Screen.height,
        color: Colors.red,
      ) :
      Container(
        child: ListView.builder(
          itemBuilder: (context,index) {
            return StateFullWidget();
          },
          itemCount: _dataArray.length,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StatefullNotePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("StatefullNotePage ---didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("StatefullNotePage ---deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print("StatefullNotePage ---dispose");
  }

  /*
  * 遵循WidgetsBindingObserver协议监听app生命周期
  * */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    debugPrint('$state');
  }
}
