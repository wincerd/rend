import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rend/Api.dart';
import 'package:rend/draw.dart';

import 'package:rend/globals.dart';
import 'package:rend/login.dart';
import 'package:rend/Verify.dart';
import 'dart:convert';
import 'package:rend/dashboard.dart';

class Transact extends StatefulWidget {
  @override
  _TransactState createState() => _TransactState();
}

class _TransactState extends State<Transact> {
  Color color;
  Color color1;
  Color color2;
  bool empty = false;

  @override
  void initState() {
    super.initState();
    _getThingsOnStartup().then((value) {
      print('Async done');
    });
    color1 = Colors.transparent;
    color = Colors.transparent;
    color2 = Colors.transparent;
  }

  Future _getThingsOnStartup() async {
    var a = await Api().transact(Globals.userz["id"], Globals.username);

    Globals.statme = json.decode(a);
    return a;
  }

  Map c() {
    Map c = {};
    if (Globals.statme != null) {
      Globals.statme.forEach((key, value) {
        var x = value.toString().split(",");
        c[key] = x;
      });
      return c;
    } else {
      empty = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final red = Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.deepOrange[400],
        ),
      ),
      drawer:Dra("Account"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Card(
          margin: EdgeInsets.all(80),
          child:ListTile(
        title: Text("there is no data to load"),
      ))
      ,
      ])
    );

    if (c.call() == null) {
      return red;
    } else if (empty == true) {
      print(empty);
      try {
        c.call();
      } catch (_) {
        return null;
      }

      return red;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Transactions',
            style: TextStyle(color: Colors.deepOrange[400]),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.deepOrange[400],
          ),
        ),
        drawer: Dra("Account"),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView.builder(
                  itemCount: c.call().length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = c.call().keys.elementAt(index);
                    return new Card(
                        child: Column(
                      children: <Widget>[
                        ListTile(
                          title: new Text(c.call()[key][2]),
                          subtitle: new Text(c.call()[key][2].toString()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(c.call()[key][0].toString()),
                            SizedBox(
                              width: 50,
                            ),
                            new Text(c.call()[key][1].toString()),
                            SizedBox(
                              width: 50,
                            ),
                            new Text(c.call()[key][2].toString()),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ));
                  },
                ))
              ],
            ),
          ),
        ),
      );
    }
  }
}
