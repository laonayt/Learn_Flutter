import 'package:flutter/material.dart';
import 'package:flutter_module/pages/detail_page.dart';
import 'package:flutter_module/pages/login_page.dart';
import 'package:flutter_module/pages/next_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'flutter_boost/simple_page_widgets.dart';

void main() => runApp(FlutterBoostApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 19.0, color: Colors.white),
      backgroundColor: Colors.grey,
      radius: 10.0,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          "loginPage" : (context) => LoginPage(),
          "detailPage" : (context) => DetailPage(),
          "nextPage" : (context) => NextPage(),
        },
      ),
    );
  }
}

//-------------------------------------------------------------------------------

class FlutterBoostApp extends StatefulWidget {
  @override
  _FlutterBoostAppState createState() => _FlutterBoostAppState();
}

class _FlutterBoostAppState extends State<FlutterBoostApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders(<String, PageBuilder>{
      'embeded': (String pageName, Map<String, dynamic> params, String _) =>
          EmbeddedFirstRouteWidget(),
      'first': (String pageName, Map<String, dynamic> params, String _) => FirstRouteWidget(),
      'firstFirst': (String pageName, Map<String, dynamic> params, String _) =>
          FirstFirstRouteWidget(),
      'second': (String pageName, Map<String, dynamic> params, String _) => SecondRouteWidget(),
      'secondStateful': (String pageName, Map<String, dynamic> params, String _) =>
          SecondStatefulRouteWidget(),
      'tab': (String pageName, Map<String, dynamic> params, String _) => TabRouteWidget(),
      'platformView': (String pageName, Map<String, dynamic> params, String _) =>
          PlatformRouteWidget(),
      'flutterFragment': (String pageName, Map<String, dynamic> params, String _) =>
          FragmentRouteWidget(params),

      ///可以在native层通过 getContainerParams 来传递参数
      'flutterPage': (String pageName, Map<String, dynamic> params, String _) {
        print('flutterPage params:$params');

        return FlutterRouteWidget(params: params);
      },
    });
    FlutterBoost.singleton.addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container(color: Colors.white));
  }

  void _onRoutePushed(
      String pageName,
      String uniqueId,
      Map<String, dynamic> params,
      Route<dynamic> route,
      Future<dynamic> _,
      ) {}
}

class TestBoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPush');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didRemove');
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print('flutterboost#didReplace');
  }
}
