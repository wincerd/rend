import 'package:flutter/material.dart';
import 'package:rend/v1.dart';
import 'package:rend/v2.dart';
import 'package:rend/v3.dart';
import 'package:rend/pic.dart';

class Verify extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

    final nextBtn = Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {},
          child: Text(
            "Next",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: ""),
              Tab( text: ""),
              Tab( text: ""),
               Tab( text: ""),
            ],
          ),
          title: Text('Verification info'),
        ),
        body: TabBarView(
          children: [
            V1(),
            V2(),
            // TakePictureScreen(),
            V3(),
             V3(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TabPageSelector(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
