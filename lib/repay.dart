import 'package:flutter/material.dart';
import 'package:rend/draw.dart';
import 'package:rend/globals.dart';
import 'package:rend/Api.dart';
import 'dart:async';
import 'package:rend/user.dart';
import 'package:rend/dashboard.dart';

class Repay extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController firstName = new TextEditingController();

  var balance = Globals.loanBalance;
  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error"),
          titlePadding: EdgeInsets.all(20.0),
          content: Text("Please pay existing loan"),
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
              },
              child: Text("try again?"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstname = TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: firstName,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        icon: Icon(Icons.monetization_on),
        hintText: 'Amount you want to repay?',
        labelText: 'Amount*',
      ),
    );
    final reqestBtn = Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: 100,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            var user = User.fromJson(Globals.userz);
            var userId = user.id;
            var phone = user.phoneNumber;
            var loanid = user.loanid;
            print("loanid $loanid");
            Map rep = await Api().repay(userId, phone.toString(),
                int.parse(firstName.text), phone, loanid);
            if (rep["success"] == false) {
              print("pay existing loan");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dash(
                    username: "name",
                  ),
                ),
              );
            } else {
              Globals.loanBalance = (rep["balance"]).toString();
              Globals.blc = int.parse(Globals.loanBalance);
              print("rep $rep");
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dash(
                    username: "name",
                    balance:Globals.blc,
                  ),
                ),
              );
            }
          },
          child: Text(
            "Repay",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repay'),
      ),
      drawer: Dra("Repayment"),
      body: Column(children: <Widget>[
        SizedBox(
          height: 50,
        ),
        firstname,
        SizedBox(
          height: 50,
        ),
        reqestBtn,
      ]),
    );
  }
}
