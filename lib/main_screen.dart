import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MeowMeow & BokBok", style: TextStyle(fontSize: 30)), 
              SizedBox(height: 20,),
              Text("เหมียวเหมียวบ๊อกบ๊อกผจญภัย", style: TextStyle(fontSize: 20)), 
              SizedBox(height: 60,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400),
                onPressed: () {
                  Navigator.of(context).pushNamed("/gamescreen");
                },
                child: const Text('Start', style: TextStyle(color: Colors.white, fontSize: 65)),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400),
                onPressed: () {
                  Navigator.of(context).pushNamed("/leaderboard");
                },
                child: const Text('Leaderboard', style: TextStyle(color: Colors.white, fontSize: 40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
