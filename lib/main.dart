import 'package:flutter/material.dart';
import 'package:rend/signup.dart';
import 'package:rend/login.dart';
import 'package:rend/dashboard.dart';
import 'package:rend/globals.dart';
import 'package:rend/Verify.dart';
import 'package:rend/Lending.dart';
import 'package:rend/repay.dart';


void main() => runApp(new MyApp());

bool logons = false;
class MyApp extends StatelessWidget {
  var  username = Globals.username; 
  var home;                                                                                                 

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hifadhi',
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/AgentPage': (BuildContext context) => new Dash(
              username:username,
            ),
        '/Signup': (BuildContext context) => new Signup(),
        '/MyHomePage': (BuildContext context) => new LoginPage(),
        '/verify':(BuildContext context) => new Verify(),
        '/borrow':(BuildContext context) => new Borrow(),
        '/repay':(BuildContext context) => new Repay(), 
      },
    );
  }
}

