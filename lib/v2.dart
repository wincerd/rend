import 'package:flutter/material.dart';


class V2 extends  StatelessWidget {
  TextEditingController firstName = new TextEditingController();
  TextEditingController employment = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController employmentCompany = new TextEditingController();
  TextEditingController dob = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
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
    final salaryField = TextFormField(
        style: style,
        controller: salary,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Second name",
          icon: Icon(Icons.person),
        ));
    final employmentField = TextFormField(
        style: style,
        controller: employment,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "employment role",
          icon: Icon(Icons.person),
        ));
    final empCompanyField = TextFormField(
        style: style,
        controller: employmentCompany,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "employment company*",
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
                  salaryField,
                  SizedBox(height: 15.0),
                  employmentField,
                  SizedBox(
                    height: 15.0,
                  ),
                  empCompanyField,
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

