import 'package:flutter/material.dart';
import 'package:flutter_notes/provider_app/models/home_item_model.dart';

import 'package:provider/provider.dart';
import '../providers/home_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of(context);
    List<HomeItemModel> dataList = provider.dataList;
    print("----homepage-build");

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ChangeNotifierProvider(
          create: (_) => provider,
          child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {

              var model = dataList[index];
              return ExpansionTile(
                title: Text(model.title),
                subtitle: Text(model.des),
              );

            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.face),
        onPressed: (){
          provider.addOne();
        },
      ),
    );
  }
}
