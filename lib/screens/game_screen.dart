import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'dart:convert';
import 'package:wireless_term_project/db/firebase.dart';
import 'package:wireless_term_project/db/db.dart';
import 'package:wireless_term_project/db/mockdb.dart';


Map<String, dynamic> parseJSON(String str){
  return json.decode(str);
}

class GameScreen extends StatefulWidget {

  DB db = MockDB();

  GameScreen({Key? key, DB? dbi}) : super(key: key){
    if (dbi != null){
      db = dbi;
    }
  }

  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<GameScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UnityWidgetController? _unityWidgetController;
  // double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_unityWidgetController != null){
      _unityWidgetController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight
      ]);
    } 
    return Scaffold(
      key: _scaffoldKey,
      body: Card(
          margin: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              UnityWidget(
                onUnityCreated: _onUnityCreated,
                onUnityMessage: onUnityMessage,
                onUnitySceneLoaded: onUnitySceneLoaded,
                useAndroidViewSurface: false,
                borderRadius: BorderRadius.all(Radius.circular(70)),
              ),
            ],
          )),
    );
  }

  // void setRotationSpeed(String speed) {
  //   _unityWidgetController?.postMessage(
  //     'Cube (1)',
  //     'SetRotationSpeed',
  //     speed,
  //   );
  // }

  void onUnityMessage(message) {
    String msg = message.toString();
    print('Received message from unity: ${msg}');
    // ensure (score, name)
    Map<String, dynamic> decoded = parseJSON(msg);
    num score = decoded["score"];
    String name = decoded["name"];
    DateTime dt = DateTime.now();

    widget.db.addScore(dt, name, score);
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    if(scene != null){
      print('Received scene loaded from unity: ${scene.name}');
      print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
    }
  }

  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    this._unityWidgetController = controller;
  }
}
