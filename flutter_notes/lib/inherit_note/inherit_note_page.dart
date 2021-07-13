import 'package:flutter/material.dart';
import 'package:flutter_notes/inherit_note/test_widget.dart';
import 'share_data_widget.dart';

// class InheritNotePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Scaffold(
//       body: Center(
//         child: ShareDataWidget(
//           shareData: ,
//         ),
//       ),
//     );
//   }
// }

class InheritNotePage extends StatefulWidget {
  @override
  _InheritNotePageState createState() => _InheritNotePageState();
}

class _InheritNotePageState extends State<InheritNotePage> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: ShareDataWidget(
          shareData: _count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TestWidget(),
              SizedBox(
                height: 100,
              ),
              Text(_count.toString()),
              ElevatedButton(
                  child: Text("增加"),
                  onPressed: () {
                    _count++;
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
