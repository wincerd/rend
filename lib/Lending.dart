

import 'package:flutter/material.dart';
import 'package:rend/globals.dart';
import 'package:rend/appB.dart';
import 'package:rend/Api.dart';
import 'dart:async';
import 'package:rend/user.dart';
import 'package:rend/dashboard.dart';

class Borrow extends StatelessWidget {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController firstName = new TextEditingController();
  var balance = Globals.blc;
  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error"),
          titlePadding: EdgeInsets.all(20.0),
          content:Text("Please pay existing loan"),
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

  @override
  Widget build(BuildContext context) {
      var a = User().loanBalance;
      print("loa $a");
      
    final firstname = TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: firstName,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        icon: Icon(Icons.person),
        hintText: 'Whats amount do you want?',
        labelText: 'loan amount*',
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
            if (balance > 0) {
              createAlertDialog(context);
            } else {
              var user = User.fromJson(Globals.userz);
              var userId = user.id;
              var phone = user.phoneNumber;
              var currency = "ksh";
              Map lend = await Api().borrow(userId,phone,int.parse(firstName.text),
              phone,currency);
              print("lend $lend");
              if(lend["success"] == false ){
                print("pay existing loan");
              }
              else{
                Globals.loanBalance = (lend["loanbalance"]).toString();
                print("lend $lend");
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dash(
                    balance: Globals.blc,
                  ),
                ),
              );
              }
            }
          },
          child: Text(
            "Request",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
    return Scaffold(
      appBar: AppBar(
          title: const Text('Borrow'),
        ),      
      drawer: Appb(),
      body:
      Column(
        children:<Widget>[
          SizedBox(height: 50,),
          firstname,
          SizedBox(height: 50,),
          reqestBtn,
        ]
      ) ,
    );
  }
}
