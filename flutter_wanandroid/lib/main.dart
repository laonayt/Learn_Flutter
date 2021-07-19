import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid/providers/provider_manager.dart';
import 'package:flutter_wanandroid/ui/home_page.dart';
import 'package:flutter_wanandroid/ui/project_page.dart';
import 'package:flutter_wanandroid/ui/structure_page.dart';
import 'package:flutter_wanandroid/ui/user_page.dart';
import 'package:flutter_wanandroid/ui/wechat_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyApp());
}

/*
层级
MultiProvider
 - RefreshConfiguration
  - ScreenUtilInit
    - OKToast
      - MaterialApp
        - MainTab
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: // 全局配置子树下的SmartRefresher,下面列举几个特别重要的属性
          RefreshConfiguration(
        headerBuilder: () =>
            WaterDropHeader(), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder: () => ClassicFooter(), // 配置默认底部指示器
        headerTriggerDistance: 80.0, // 头部触发刷新的越界距离
        springDescription: SpringDescription(
            stiffness: 170,
            damping: 16,
            mass: 1.9), // 自定义回弹动画,三个属性值意义请查询flutter api
        maxOverScrollExtent: 100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxUnderScrollExtent: 0, // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted:
            true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
        child: ScreenUtilInit(
          designSize: Size(360, 690), //填入设计稿中设备的屏幕尺寸,单位dp
          builder: () {
            return OKToast(
              child: MaterialApp(
                title: '玩安卓',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: MainTab(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          HomePage(),
          ProjectPage(),
          StructurePage(),
          WeChatPage(),
          UserPage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_a_photo,
            ),
            label: "项目",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.padding_sharp,
              ),
              label: "结构"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: "公众号"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_a_photo,
              ),
              label: "我的"),
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
