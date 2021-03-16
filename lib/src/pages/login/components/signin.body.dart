import 'dart:convert';
import 'package:encuerapp/src/pages/home/home.screen.dart';
import 'package:encuerapp/src/pages/login/components/rounded_button.dart';
import 'package:encuerapp/src/pages/login/components/rounded_input_field.dart';
import 'package:encuerapp/src/pages/login/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:encuerapp/src/pages/login/components/signin.background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


  class Body extends StatefulWidget {
    @override
    _BodyState createState() => _BodyState();
  }

  class _BodyState extends State<Body>{

    SharedPreferences sharedPreferences;
    bool _isLoading = false;

    final TextEditingController matriculaController = new TextEditingController();
    final TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: _isLoading ? Center(child: CircularProgressIndicator(),) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Matricula",
              onChanged: (value) {
                matriculaController.text = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passController.text = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (matriculaController.text != "" || passController.text != "" ) {
                setState(() {
                  _isLoading = true;
                });
                signIn(matriculaController.text, passController.text);
              }
              },
            ),
          ],
        ),
      ),
    );
  }

  void signIn(String matricula, pass ) async {
    // body: jsonEncode(<String, String>{
    //     'matricula': matricula,
    //     'password': pass
    //   })

    try {

      var url = 'http://192.168.1.64:3000/encuerapi/auth/signin';
      var response = await http.post(url, body: {
        'matricula': matricula,
        'password': pass
      })
        .timeout(const Duration(seconds: 90));

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonResponse = null;
    jsonResponse = json.decode(response.body);
    print('status res ${ response.statusCode }');
    print('status body ${ response.body }');
    if ( jsonResponse != null ) {
      setState((){
        _isLoading = false;
      });
      sharedPreferences.setString("token", jsonResponse['token']);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);

    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
      

    } on TimeoutException catch (e) {
      print('Limit exceded');
    } on Error catch(e) {
      print(e);
    }

  }

}