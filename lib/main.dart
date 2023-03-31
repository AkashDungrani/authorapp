
import 'package:author/view/screens/homepage.dart';
import 'package:author/view/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    initialRoute: "splash",
    routes: {
      "splash": (context) => SplashScreen(),
      "/": (context) => HomePage(),
    },
  ));
}
