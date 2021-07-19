import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/providers/base_provider.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends BaseProvier> extends StatefulWidget {
  final T provider;
  final Function(T provider) onModelReady;
  final ValueWidgetBuilder<T> builder;

  ProviderWidget({
    required this.provider,
    required this.onModelReady,
    required this.builder,
  });

  @override
  _ProviderWidgetState createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends BaseProvier>
    extends State<ProviderWidget<T>> {
  @override
  void initState() {
    widget.onModelReady(widget.provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => widget.provider,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
