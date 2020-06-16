import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rend/dashboard.dart';
import 'package:rend/user.dart';
import 'package:rend/Api.dart';
import 'package:rend/globals.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String _username, _password = "";
  String msg = '';
  User usea = User();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool engaged = false;



  Future<String> createAlertDialog(BuildContext context,String content) {
    if(engaged){
      return null;
    }
    else{
      engaged = true;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error"),
          titlePadding: EdgeInsets.all(20.0),
          content: Text(content),
          contentPadding: EdgeInsets.all(20.0),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                // Navigator.of(context).pop(_controller.text.toString());
              },
              child: Text("cancle"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/MyHomePage');
                engaged = false;
              },
              child: Text("try again?"),

            ),
          ],
        );
      },
    );
    }
  }

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      try {
      var logn = await Api().login(user.text, pass.text);
      print("logn $logn");
      var tMap = json.decode(logn);
      setState(() {
        usea = User.fromJson(tMap);
        print(usea);
        Globals.userz = tMap;
      });

      
        } on SocketException catch (_) {
          createAlertDialog(context,"please check you have a working connection");
    }
      if (usea.success == "true") {
        Globals.email = usea.email;
        Globals.username = usea.firstname;
        Globals.secondname = usea.secondname;
        Globals.loanBalance = usea.loanBalance;
        Globals.token = usea.token;
        Globals.blc = int.parse(Globals.loanBalance);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Dash(
                    username: usea.firstname,
                  )),
        );

        setState(() {
          Globals.username = "Admin";
        });
      } else {
        createAlertDialog(context,"invalid credentials");
      }
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final flatbtn = Material(
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/Signup');
        },
        child: Text("Sign up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
    );
    String validateMobile(String value) {
      if (value.length != 10)
        return 'Mobile Number  digits are less than 10';
      else
        return null;
    }
    String validatePassword(String value) {
      print(value.length <3);
      if (value.length < 4)
        return 'Password length must be greater than 4';
      else
        return null;
    }
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: (Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0),
                    child: TextFormField(
                      controller: user,
                      validator: validateMobile,
                      onSaved: (String val) {
                        _username = val;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: 'Phone number'),
                    ),
                  ),
                  TextFormField(
                    controller: pass,
                    obscureText: true,
                    validator: validatePassword,
                    onSaved: (String val) {
                      _password = val;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Password'),
                  ),
                  SizedBox(height: 70),
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: () async {
                      _validateInputs();
                      
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "dont have an account ?",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 100, child: flatbtn),
                  Text(
                    msg,
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
