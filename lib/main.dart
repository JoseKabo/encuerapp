import 'package:encuerapp/src/pages/home/home.screen.dart';
import 'package:encuerapp/src/pages/login/sigin.screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encuerap',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : ( BuildContext context ) => LoginScreen(),
        'home' : ( BuildContext context ) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

