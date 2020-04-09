import 'package:flutter/material.dart';
import 'package:rend/Api.dart';
import 'package:rend/login.dart';
import 'package:rend/globals.dart';
import 'dart:convert';

class Signup extends StatelessWidget {
  TextEditingController firstName = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController id = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      controller: email,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        icon: Icon(Icons.mail),
      ),
    );
    final passwordField = TextFormField(
        obscureText: true,
        style: style,
        controller: password,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          icon: Icon(Icons.lock),
          hintText: "Password",
          labelText: 'password*',
        ));
    final firstname = TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: firstName,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        icon: Icon(Icons.person),
        hintText: 'Whats your first name?',
        labelText: 'First Name *',
      ),
    );
    final secondname = TextFormField(
        style: style,
        controller: secondName,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Second name",
          icon: Icon(Icons.person),
        ));
    final lastname = TextFormField(
        style: style,
        controller: lastName,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last name",
          icon: Icon(Icons.person),
        ));
    final idField = TextFormField(
        style: style,
        controller: id,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Id Number*",
          icon: Icon(Icons.phone),
        ));
    final numberField = TextFormField(
        style: style,
        controller: number,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "number",
          icon: Icon(Icons.phone),
        ));
    final loginButton = Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            var num = (number.text);
            print("num,$num");
            var a = await Api().signup(firstName.text, secondName.text,
                lastName.text, email.text, num, password.text,num,id.text);
            print("response,$a");
            var  aMap = json.decode(a);
            print(aMap);
            if (aMap.success == "true") {
              print(a.message);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }
          },
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 10,
                //   // child: Image.asset(
                //   //   "images/bank.png",
                //   //   fit: BoxFit.contain,
                //   // ),
                // ),
                SizedBox(height: 15.0),
                emailField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(height: 15.0),
                firstname,
                SizedBox(height: 15.0),
                secondname,
                SizedBox(height: 15.0),
                lastname,
                SizedBox(
                  height: 15.0,
                ),
                numberField,
                SizedBox(
                  height: 15.0,
                ),
                idField,
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: 150,
                  child: loginButton,
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
