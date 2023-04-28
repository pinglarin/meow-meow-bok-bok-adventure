import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'screens/leaderboard.dart';
import 'screens/game_screen.dart';


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:wireless_term_project/db/firebase.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wireless term project',  
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/gamescreen': (context) => GameScreen(dbi: FirebaseDB()),
        '/leaderboard': (context) => LeaderboardScreen(dbi: FirebaseDB()),
      },
    );
  }
}
