import 'package:flutter_wanandroid/providers/project_provider.dart';
import 'package:flutter_wanandroid/providers/structure_provider.dart';
import 'package:flutter_wanandroid/providers/user_provider.dart';
import 'package:flutter_wanandroid/providers/wechat_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'home_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => HomeProvider()),
  ChangeNotifierProvider(create: (context) => ProjectCategoryProvider()),
  ChangeNotifierProvider(create: (context) => ProjectListProvider()),
  ChangeNotifierProvider(create: (context) => StructureProvider()),
  ChangeNotifierProvider(create: (context) => WeChatProvider()),
  ChangeNotifierProvider(create: (context) => UserProvider()),
];
