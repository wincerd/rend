import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rend/dashboard.dart';
import 'package:rend/user.dart';
import 'package:rend/Api.dart';
import 'package:rend/globals.dart';

class LoginPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';
  User usea = User();

    Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error"),
          titlePadding: EdgeInsets.all(20.0),
          content:Text("invalid credentials"),
          contentPadding: EdgeInsets.all(20.0),
          actions: <Widget>[
            MaterialButton(onPressed: () {
              // Navigator.of(context).pop(_controller.text.toString());
            }, child: Text("cancle"),),
            MaterialButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            }, child: Text("try again?"),),
          ],
        );
      },
    );
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
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Username'),
                  ),
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'Password'),
                ),
                SizedBox(height: 70),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () async {
                    Map a ={"username":user.text,"password":pass.text};
                    var tex = await Api().all("http://176.58.113.106:80/api/login",a);
                    print("tex $tex");
                    var tMap = json.decode(tex);
                    setState(() {
                      usea = User.fromJson(tMap);
                    });
                    if (usea.success == "true") {
                      Globals.email = usea.email;
                      Globals.username = usea.firstname;
                      Globals.secondname = usea.secondname;
                      Globals.loanBalance = usea.loanBalance;
                      Globals.token =usea.token;
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
                     createAlertDialog(context);
                    }
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
    );
  }
}
