import 'package:flutter/material.dart';
import 'package:rend/Verify.dart';
import 'package:rend/globals.dart';
import 'package:rend/login.dart';
import 'package:rend/appB.dart';

class Rtn extends StatefulWidget {
  @override
  _RtnState createState() => _RtnState();
}

class _RtnState extends State<Rtn> {
  @override
  Widget build(BuildContext context) {
    final btn1 = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 10),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/borrow');
        },
        child: Text("Borrow Loan", style: TextStyle(color: Colors.white)),
        color: Colors.blueAccent,
      ),
    );
    final btn2 = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 10),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/repay');
        },
        child: Text("Pay loan", style: TextStyle(color: Colors.white)),
        color: Colors.blueAccent,
      ),
    );
    if (Globals.blc > 0 == false) {
      return btn1;
    } else {
      return btn2;
    }
  }
}

class Dash extends StatefulWidget {
  Dash({this.username});
  final String username;
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text("settings"),
                backgroundColor: Colors.blueGrey,
                iconTheme: IconThemeData(color: Colors.blue),
              ),
              UserAccountsDrawerHeader(
                accountName: Text(Globals.username + " " + Globals.secondname),
                accountEmail: Text(Globals.email),
                currentAccountPicture: CircleAvatar(
                    // backgroundImage:  AssetImage("images/profie.jpeg"),
                    ),
              ),
              SizedBox(height: 250),
              ListTile(
                title: Text("Verify"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Verify()),
                  );
                },
              ),
              ListTile(
                  title: Text("Logout"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Loan Balance"),
                                    SizedBox(
                                      width: 95,
                                    ),
                                    Text((Globals.loanBalance).toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Due date"),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Text("18/04/2022"),
                                  ],
                                ),
                              ],
                            ),
                          ])
                    ]),
                    Rtn(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("second info"),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Loan status'),
                      subtitle: Text('we are following up with.......'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Request again'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('Cancle'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
