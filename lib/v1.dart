import 'package:flutter/material.dart';
import 'package:rend/globals.dart';

class V1 extends StatefulWidget {
  final ValueChanged<String> child2Action;

const V1({
    Key key,

    this.child2Action,
    
  }) : super(key: key);

  @override
  _V1State createState() => _V1State();
}

class _V1State extends State<V1>{
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  TextEditingController idNumber = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  @override
   void initState() {
    
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    final firstname = TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: firstName,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        icon: Icon(Icons.person),
        hintText: 'Whats your first name?',
        labelText: 'First Name *',
      ),
    );
    final secondname = TextFormField(
        style: sty,
        controller: secondName,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Second name",
          icon: Icon(Icons.person),
        ));
    final lastname = TextFormField(
        style: sty,
        controller: lastName,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last name",
          icon: Icon(Icons.person),
        ));
    final idField = TextFormField(
        style: sty,
        controller: idNumber,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Id Number*",
          icon: Icon(Icons.phone),
        ));

    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  firstname,
                  SizedBox(height: 15.0),
                  secondname,
                  SizedBox(height: 15.0),
                  lastname,
                  SizedBox(
                    height: 15.0,
                  ),
                  idField,
                  SizedBox(
                    height: 15.0,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
TextStyle sty = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
