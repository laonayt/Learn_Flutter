import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _camera;

  StreamController<int> _rotYStreamController;
  Stream _rotYStream;
  StreamSink _rotYSink;
  var _tempCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _rotYStreamController = StreamController();
    _rotYStream = _rotYStreamController.stream;
    _rotYSink = _rotYStreamController.sink;

    _count();

    _initCamera();
  }

  _initCamera() async {
    var cameras = await availableCameras();
    _camera = CameraController(cameras[0], ResolutionPreset.low, enableAudio: false);
     await _camera.initialize();
     setState(() {});
    _camera.startImageStream((image) {
      // print(image);
    });
  }

  _count() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _rotYSink.add(_tempCount);
      _tempCount++;
    });
  }

  @override
  void dispose() {
    _camera.dispose();
    _rotYSink.close();
    _rotYStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: Text("相机初始化中..."),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: CameraPreview(_camera),
        ),
        Column(
          children: [
            ElevatedButton(
              child: Text("按钮"),
              onPressed: (){},
            ),
            StreamBuilder(
              stream: _rotYStream,
              initialData: 0,
              builder: (context, snapshot){
                var rotY = snapshot.data;
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text(rotY.toString()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

}
