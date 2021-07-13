import 'package:flutter/material.dart';
import '../providers/discover_provider.dart';
import 'package:provider/provider.dart';

class DiscoverDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DiscoverProvider provider = Provider.of<DiscoverProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: Consumer<DiscoverProvider>(
        builder: (context, provider, child){
          return Container(
            alignment: Alignment.center,
            child: Text(provider.count.toString(), style: TextStyle(color: Colors.cyan, fontSize: 30),),
          );
        },
      ),

      // body: ChangeNotifierProvider(
      //   create: (_) => provider,
      //   child: Container(
      //     alignment: Alignment.center,
      //     child: Text(provider.count.toString(), style: TextStyle(color: Colors.cyan, fontSize: 30),),
      //   ),
      // ),
    );
  }
}
