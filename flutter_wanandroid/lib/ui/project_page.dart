import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid/components/state_view_widget.dart';
import 'package:flutter_wanandroid/providers/base_provider.dart';
import 'package:flutter_wanandroid/providers/project_provider.dart';
import 'package:flutter_wanandroid/providers/provider_widget.dart';
import 'package:flutter_wanandroid/ui/article_list_widget.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("项目"),
      ),

      body: ProviderWidget<ProjectListProvider>(
          provider: ProjectListProvider(),
          onModelReady: (provider) {
            provider.initData();
          },
          builder: (_, provider, __) {
            print("当前页面状态：${provider.viewState}");

            if (provider.viewState == ViewState.busy) {
              return WELoadingWidget();
            } else if (provider.viewState == ViewState.error) {
              return WEErrorWidget();
            }
            return Container(
              height: ScreenUtil().screenHeight - 200,
              child: ArticleListWidget(articleList: provider.dataList),
            );
          }),

      // body: ProviderWidget<ProjectCategoryProvider>(
      //   provider: ProjectCategoryProvider(),
      //   onModelReady: (provider) {
      //     provider.requestData();
      //   },
      //   builder: (context, provider, child) {
      //     return Container(
      //       color: Colors.pink,
      //     );
      //   },
      // ),

      // body: Container(
      //   child: ChangeNotifierProvider(
      //     create: ProjectProvider(),
      //     child: Consumer(
      //       builder: (context, provider, child) {
      //         return Container(
      //           child: Text("对对对"),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
