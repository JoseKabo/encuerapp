import 'package:encuerapp/src/pages/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/signin.body.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen(
    {
      Key key,
      @required this.context
    }
  ) : super(key: key);

  final BuildContext context;
  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if ( sharedPreferences.getString("token") != null ){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}