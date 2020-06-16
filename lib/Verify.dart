import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rend/Api.dart';
import 'package:rend/draw.dart';

import 'package:rend/pic.dart';
import 'package:rend/globals.dart';
import 'package:rend/dashboard.dart';
import 'package:rend/login.dart';

String dropdownValue = 'Primary school';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> with SingleTickerProviderStateMixin {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  TextEditingController idNumber = new TextEditingController();
  TextEditingController employment = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController employmentCompany = new TextEditingController();
  TextEditingController highestEducation = new TextEditingController();
  TextEditingController maritalstate = new TextEditingController();

  String fname, sname, lname, idnum;
  int _tabIndex = 0;
  TabController _tabController;

  String dropdownValue = 'One';
  String dropdown = 'Married';

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  var finaldate;
  Color color;
  Color color1;
  Color color2;

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
    });
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
    } else {}
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    color1 = Colors.transparent;
    color = Colors.transparent;
    color2 = Colors.transparent;
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabChange);
  }

  void _toggleTab(int x) {
    _tabIndex = _tabController.index + x;
    _tabController.animateTo(_tabIndex);
  }

  void _handleTabChange() {
    _validateInputs();
  }

  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.deepOrange[400]);
  @override
  Widget build(BuildContext context) {
    String validateMobile(String value) {
      if (value.length != 10)
        return 'Mobile Number  digits are less than 10';
      else
        return null;
    }

    String validatePassword(String value) {
      print(value.length < 3);
      if (value.length < 4)
        return 'Password length must be greater than 4';
      else
        return null;
    }

    String validateEmail(String value) {
      print(value.length < 3);
      if (value.length < 4)
        return 'Password length must be greater than 4';
      else
        return null;
    }

    String validateId(String value) {
     
      if (value.length < 8)
        return 'id length must be equal to 8 ';
      else
        return null;
    }

    String validateExtra(String value) {
      print(value.isNotEmpty);
      if (value.isNotEmpty)
        return null;
      else
        return 'Field is empty';
    }

    final firstname = TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: firstName,
      validator: validateExtra,
      onSaved: (String val) {
        fname = val;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Whats your first name?',
        icon: Icon(Icons.person,color: Colors.deepOrange),
        labelText: 'First Name *',
      ),
    );

    final secondname = TextFormField(
        style: style,
        controller: secondName,
        validator: validateExtra,
        onSaved: (String val) {
          sname = val;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Second name",
          icon: Icon(Icons.person,color: Colors.deepOrange[400]),
        ));
    final lastname = TextFormField(
        style: style,
        controller: lastName,
        validator: validateExtra,
        onSaved: (String val) {
          lname = val;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last name",
          icon: Icon(Icons.person,color: Colors.deepOrange[400]),
        ));
    final idField = TextFormField(
        style: style,
        controller: idNumber,
        validator: validateId,
        onSaved: (String val) {
          idnum = val;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Id Number*",
          icon: Icon(Icons.phone,color: Colors.deepOrange[400]),
        ));
    final salaryField = TextFormField(
        style: style,
        controller: salary,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Salary",
          icon: Icon(Icons.monetization_on,color: Colors.deepOrange[400]),
        ));
    final employmentField = TextFormField(
        style: style,
        controller: employment,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "employment role",
          icon: Icon(Icons.business_center,color: Colors.deepOrange[400]),
          
        ));
    final empCompanyField = TextFormField(
        style: style,
        controller: employmentCompany,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "employment company*",
          icon: Icon(Icons.business,color: Colors.deepOrange[400]),
        ));

    final highestEdu = EduWidget();

    final dateb = FlatButton(
        color: Colors.white,
        onPressed: () {
          getDate();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: Colors.deepOrange[400],
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Date of birth",
              textAlign: TextAlign.center,
              style: style,
            ),
          ],
        ));
    final maritalState = DropdownButton<String>(
      value: dropdown,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepOrange[400]),
      underline: Container(
        height: 2,
        color: Colors.deepOrange[400],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdown = newValue;
        });
      },
      items: <String>['Married', 'single', 'x', 'widow/widower']
          .map<DropdownMenuItem<String>>((String value2) {
        return DropdownMenuItem<String>(
          value: value2,
          child: Text(value2),
        );
      }).toList(),
    );
    final submitBtn = Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            var a = Api().verify(
                Globals.username,
                firstName.text,
                secondName.text,
                lastName.text,
                idNumber.text,
                finaldate,
                dropdownValue,
                dropdown,
                employment.text,
                employmentCompany.text,
                salary.text,
                Globals.username);

            print(a);
          },
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.deepOrange[400], fontWeight: FontWeight.bold),
          ),
        ));

    return MaterialApp(
      home: Scaffold(
        drawer: Dra("verify"),
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: ""),
              Tab(text: ""),
              Tab(text: ""),
            ],
          ),
          title: Text('Verification info',style: TextStyle(color: Colors.deepOrange[400]),),
          backgroundColor:  Colors.black,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Scaffold(
              body: SafeArea(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(36.0),
                    child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                            dateb,
                          ]),
                    ),
                  ),
                ),
             
            ), SafeArea(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(36.0),

                    child:  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                color: Colors.deepOrange[400],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Education Lvl",
                                style: style,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              highestEdu,
                            ],
                          ),
                          salaryField,
                          SizedBox(height: 15.0),
                          employmentField,
                          SizedBox(
                            height: 15.0,
                          ),
                          empCompanyField,
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.cake,
                                color: Colors.deepOrange[400],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Marital status",
                                style: style,
                              ),
                              SizedBox(width: 15.0),
                              maritalState,
                            ],
                          ),
                          SizedBox(height: 15),
                          submitBtn
                        ]),
                  ),
                ),
              ),
            ),
            // TakePictureScreen(),
            UploadImageDemo(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          if (_tabController.index == 0) {
                            _toggleTab(0);
                          } else {
                            _toggleTab(-1);
                          }
                        },
                        child: Icon(Icons.navigate_before,
                            color: Colors.deepOrange[400]),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (_tabController.index == 3) {
                            _toggleTab(0);
                          } else {
                            _toggleTab(1);
                          }
                        },
                        child:
                            Icon(Icons.navigate_next, color: Colors.deepOrange[400]),
                      ),
                    ],
                  ),
                  TabPageSelector(
                    controller: _tabController,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EduWidget extends StatefulWidget {
  EduWidget({Key key}) : super(key: key);

  @override
  _EduWidget createState() => _EduWidget();
}

class _EduWidget extends State<EduWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward,color: Colors.deepOrange[400]),
      
      
      iconSize: 20,
      elevation: 10,
      style: TextStyle(color: Colors.deepOrange[400]),
      underline: Container(
        height: 1,
        color: Colors.deepOrange[400],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Primary school', 'High School', 'collage', 'University']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
