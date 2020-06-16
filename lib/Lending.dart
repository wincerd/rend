import 'package:flutter/material.dart';
import 'package:rend/draw.dart';
import 'package:rend/globals.dart';
import 'package:rend/Api.dart';
import 'dart:async';
import 'package:rend/user.dart';
import 'package:rend/dashboard.dart';

class Borrow extends StatefulWidget {
  @override
  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController firstName = new TextEditingController();
  String timeframe = Globals.timeframe;
  var balance = Globals.blc;
  int amount;
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
                timeframe = null;
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
@override
  void initState() {

    setState(() {
    
     Globals.mounty == null ? firstName.text = "0" : firstName.text = Globals.mounty.toString(); 
    });
     
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
        hintText: 'how much do you want?',
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
            Globals.mounty = int.parse(firstName.text);
            if (balance > 0) {
              createAlertDialog(context, "error", "Please pay existing loan");
            } else if (timeframe == null) {
              createAlertDialog(context, "warning", "Please select time frame");
              setState(() {               
              });
            } else {
              var user = User.fromJson(Globals.userz);
              var userId = user.id;
              var phone = user.phoneNumber;
              var currency = "ksh";
              Map lend = await Api().borrow(userId, phone,
                  int.parse(firstName.text), phone, currency, timeframe);
              print("lend $lend");
              if (lend["success"] == false) {
                print("pay existing loan");
                createAlertDialog(context, "Warning",
                    "their was an error generating your loan  please try again later");
              } else {
                createAlertDialog(context, "Attention",
                    "your loan has been processed succesfully");
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
          title: Text(
            'Borrow',
            style: TextStyle(color: Colors.deepOrange[400]),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.deepOrange[400],
          ),
        ),
        drawer: Dra("Borrow"),
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Card(
                        elevation: 3,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      Globals.loanlimit == null
                                          ? "500"
                                          : Globals.loanlimit,
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ]),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Loan Limit",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ]),
                            ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Card(
                        elevation: 3,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(Icons.calendar_today),
                                title: Text('Choose Repayment period'),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    MaterialButton(
                                      color: Colors.white70,
                                      onPressed: () {
                                        createAlertDialog(context, "Attention",
                                            "Timeframe for the loan \n has been set to 1 mnth ");
                                        Globals.timeframe = "month";
                                      },
                                      child: Text(
                                        "1 month",
                                        style: TextStyle(
                                            color: Colors.deepOrange[400]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    MaterialButton(
                                      color: Colors.white70,
                                      onPressed: () {
                                        createAlertDialog(context, "Attention",
                                            "Timeframe for the loan \n has been set to 14 days ");
                                        Globals.timeframe = "2 weeks";
                                      },
                                      child: Text(
                                        "14 days",
                                        style: TextStyle(
                                            color: Colors.deepOrange[400]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    MaterialButton(
                                      color: Colors.white70,
                                      onPressed: () {
                                        createAlertDialog(context, "Attention",
                                            "Timeframe for the loan \n has been set to 7 days ");
                                        Globals.timeframe = "one  week";
                                      },
                                      child: Text(
                                        "7 days",
                                        style: TextStyle(
                                            color: Colors.deepOrange[400]),
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: 30,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      firstname,
                      SizedBox(
                        height: 50,
                      ),
                      reqestBtn,
                    ]),
              ),
            ),
          ),
        ));
  }
}
