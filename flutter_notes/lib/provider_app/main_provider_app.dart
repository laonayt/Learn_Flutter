import 'package:flutter/material.dart';
import 'package:flutter_notes/provider_app/wangyi_news/viewmodel/newslist_viewmodel.dart';
import 'package:provider/provider.dart';

import 'ui/home_page.dart';
import 'ui/discover_page.dart';
import 'providers/home_provider.dart';
import 'providers/discover_provider.dart';
import 'wangyi_news/view/newslist_page.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => DiscoverProvider()),
        ChangeNotifierProvider(create: (context) => NewsListViewModel()),
      ],
      child: MaterialApp(
        home: MainTablePage(),
      ),
    );
  }
}

//错误的！Provider必须在MaterialApp上边
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => DiscoverProvider()),
        ],
        child: MainTablePage(),
      ),
    );
  }
}

class MainTablePage extends StatefulWidget {
  @override
  _MainTablePageState createState() => _MainTablePageState();
}

class _MainTablePageState extends State<MainTablePage> {
  var _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          HomePage(),
          DiscoverPage(),
          NewsListPage(),
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            label: "发现",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.accessibility_new),
          //   label: "新闻",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.print),
            label: "玩安卓",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
