import 'package:flutter/material.dart';
import 'package:rend/Api.dart';
import 'package:rend/Verify.dart';
import 'package:rend/globals.dart';
import 'package:rend/login.dart';
import 'package:rend/user.dart';

class Rtn extends StatefulWidget {
  @override
  _RtnState createState() => _RtnState();
}

class _RtnState extends State<Rtn> {
  @override
  Widget build(BuildContext context) {
    final btn1 = MaterialButton(
      splashColor: Colors.deepOrange[400],
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/borrow');
      },
      child: Text(
        "Borrow Loan",
        style: TextStyle(
          color: Colors.deepOrange[400],
          fontSize: 20.0,
        ),
      ),
    );
    final btn2 = MaterialButton(
      splashColor: Colors.deepOrange[400],
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/repay');
      },
      child: Text("Pay loan",
          style: TextStyle(
            color: Colors.deepOrange[400],
            fontSize: 20.0,
          )),
    );
    print(int.parse(Globals.loanBalance) == 0);

    if (int.parse(Globals.loanBalance) == 0) {
      return btn1;
    } else if (int.parse(Globals.loanBalance) < 0) {
      
      return btn1;
    } else {
      return btn2;
    }
  }
}

class Dash extends StatefulWidget {
  Dash({this.username, this.balance});
  final String username;
  int balance;
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  Color color;
  Color color1;
  Color color2;

  @override
  void initState() {
    super.initState();
    color1 = Colors.transparent;
    color = Colors.transparent;
    color2 = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    // var b = 100;
    var b = Globals.loanBalance;
    // print("blc $b");
    // print(Globals.loanBalance);
    // print(Globals.blc);
    // print(Globals.userz["id"]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "Settings",
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
                  )),
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
          
        ),
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.deepOrange[400]),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Loan Balance",
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                  SizedBox(
                    width: 60,
                  ),
                  Text(":  " + (b).toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Due date",
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                  SizedBox(
                    width: 35,
                  ),
                  Text("18/04/2022",
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Rtn(),
                  ]),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                splashColor: Colors.deepOrange[400],
                color: Colors.white30,
                child: Text(
                  'Transactions',
                  style: TextStyle(color: Colors.deepOrange[400], fontSize: 20),
                ),
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, '/transact');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
