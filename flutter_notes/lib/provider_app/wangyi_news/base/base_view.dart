import 'package:flutter/material.dart';
import 'package:flutter_notes/provider_app/wangyi_news/viewmodel/newslist_viewmodel.dart';
import 'package:provider/provider.dart';
import 'base_viewmodel.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {

  final T viewModel;
  final Widget child;
  final Function(T) requestNetWork;
  final Widget Function(BuildContext context, T viewModel, Widget child) builder;

  BaseView({this.viewModel, this.child, this.requestNetWork, this.builder});


  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView> {

  @override
  void initState() {
    if (widget.requestNetWork != null) {
      widget.requestNetWork(widget.viewModel);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => widget.viewModel,
      child: Consumer(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
