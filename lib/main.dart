//import database
import 'package:firebase_core/firebase_core.dart';

//import navigations
import 'package:sciolism_app/screens/main_page.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------


int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize Firebase
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = (preferences.getInt('initScreen') ?? 0);
  await preferences.setInt('initScreen', 1);
  runApp(SciolismApp());
}

class SciolismApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sciolism',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        cardColor: Colors.white70,
        accentColor: Colors.white,
      ),
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboarding' : 'auth',
      routes: {
        'onboarding': (context) => MainPage(),
        'auth': (context) => MainPage(),
      },
    );
  }
}
