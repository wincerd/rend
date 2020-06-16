import 'package:flutter/material.dart';
import 'package:rend/Api.dart';
import 'package:rend/login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController id = new TextEditingController();

  int _state = 0;

  Future<String> createAlertDialog(
      BuildContext context, String lvl, String msg) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(lvl),
          titlePadding: EdgeInsets.all(20.0),
          content: Text(msg),
          contentPadding: EdgeInsets.all(20.0),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/borrow');
              },
              child: Text("cancle"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/borrow');
              },
              child: Text("ok"),
            ),
          ],
        );
      },
    );
  }

  Future<String> createprogDialog(BuildContext context, String lvl) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CircularProgressIndicator(
          semanticsLabel: lvl,
        );
      },
    );
  }

  show() {
    if (_state == 1) {
      return createprogDialog(context, "loading");
    }
  }

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
          hintText: "Number",
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
            setState(() {
              _state = 1;
            });

            Map a = await Api().signup(firstName.text, secondName.text,
                lastName.text, email.text, num, password.text, num, id.text);
            print("response,$a");
            if (a["success"] == "true") {
              setState(() {
                _state = 0;
              });
              createAlertDialog(context, "alert", "Siged up successfully");
              print(a["message"]);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else {
              String msg = a["mesage"]
                  ? null
                  : "Sign up not  successfully please try again later";
              createAlertDialog(context, "warning", msg);
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
