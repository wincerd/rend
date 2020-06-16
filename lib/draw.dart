import 'package:flutter/material.dart';


import 'package:rend/globals.dart';
import 'package:rend/login.dart';
import 'package:rend/Verify.dart';

import 'package:rend/dashboard.dart';

class Dra extends StatefulWidget {
   String _title;
   Dra(this._title);
  @override
  _DraState createState() => _DraState(_title);
}

class _DraState extends State<Dra> {
  String _title;
 _DraState(this._title);
 

  Color color;
  Color color1;
  Color color2;
  bool empty = false;

  @override
  void initState() {
    super.initState();
    print(_title);   
    color1 = Colors.transparent;
    color = Colors.transparent;
    color2 = Colors.transparent;
  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  _title.toString(),
                  style: TextStyle(color: Colors.deepOrange[400]),
                ),
                backgroundColor: Colors.black,
              ),
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.deepOrange[400],

                      child: Icon(
                        Icons.person,
                      ),
                      // backgroundImage:  AssetImage("images/profie.jpeg"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Globals.username,
                          style: TextStyle(color: Colors.deepOrange[400]),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          Globals.secondname,
                          style: TextStyle(color: Colors.deepOrange[400]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: color,
                padding: EdgeInsets.all(5),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.deepOrange[400]),
                  title: Text(
                    "Dashboard",
                    style:
                        TextStyle(fontSize: 20, color: Colors.deepOrange[400]),
                  ),
                  onTap: () {
                    setState(() {
                      color = Colors.grey;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dash()),
                    );
                    setState(() {
                      color = Colors.transparent;
                    });
                  },
                ),
              ),
              Container(
                color: color1,
                padding: EdgeInsets.all(5),
                child: ListTile(
                  leading:
                      Icon(Icons.perm_identity, color: Colors.deepOrange[400]),
                  title: Text(
                    "Verification",
                    style:
                        TextStyle(fontSize: 20, color: Colors.deepOrange[400]),
                  ),
                  onTap: () {
                    setState(() {
                      color1 = Colors.grey;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Verify()),
                    );
                  },
                ),
              ),
              SizedBox(height: 200),
              Container(
                color: color2,
                padding: EdgeInsets.all(10),
                child: ListTile(
                    leading:
                        Icon(Icons.exit_to_app, color: Colors.deepOrange[400]),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 20, color: Colors.deepOrange[400]),
                    ),
                    onTap: () {
                      setState(() {
                        color2 = Colors.grey;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }),
              ),
            ],
          ),
 
    );
  }
}