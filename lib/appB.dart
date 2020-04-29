import 'package:flutter/material.dart';
import 'package:rend/globals.dart';
import 'package:rend/login.dart';
import 'package:rend/Verify.dart';


class Appb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
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
                  "Verify" 
                  ),
                onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Verify() 
                        ),
                      );
                },
              ),
             
              ListTile(         
                title: Text(
                  "Logout"
                  ),
                onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage() 
                        ),
                      );                      
                }  
              ),

            ],
          ),
    );
  }
}