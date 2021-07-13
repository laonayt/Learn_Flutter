import 'package:flutter/material.dart';
import 'discover_detail_page.dart';
import 'package:flutter_notes/utils/route_util.dart';
import '../providers/discover_provider.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DiscoverProvider provider = Provider.of<DiscoverProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => provider,
        child: GestureDetector(
          child: Container(
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text(provider.count.toString(), style: TextStyle(color: Colors.cyan, fontSize: 30),),
          ),
          onTap: (){
            pushPage(context, DiscoverDetailPage());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.face),
        onPressed: (){
          provider.addCount();
        },
      ),
    );
  }
}
