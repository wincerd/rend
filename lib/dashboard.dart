import 'package:flutter/material.dart';
import 'package:rend/Verify.dart';
import 'package:rend/globals.dart';
import 'package:rend/login.dart';

class Dash extends StatefulWidget {
  Dash({this.username});
  final String username;
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                accountName: Text(Globals.username+" "+Globals.secondname),
                accountEmail: Text(Globals.email),
                currentAccountPicture: CircleAvatar(
                    // backgroundImage:  AssetImage("images/profie.jpeg"),
                    ),
              ),
              SizedBox(height: 250),
              ListTile(         
                title: Text(
                  "Title"
                  ),
                onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage() 
                        ),
                      );                      
                }  
              ),
               ListTile(         
                title: Text(
                  "Verify"
                  ),
                onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Verify() 
                        ),
                      );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Sample Code'),
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
                    Text("loan"),
                    MaterialButton(
                      onPressed: () {},
                      child: Text("Borrow",
                      style:TextStyle(color: Colors.white)),
                      color:Colors.blueAccent,
                    )
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
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
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
