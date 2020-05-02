import 'package:flutter/material.dart';
import 'package:rend/Api.dart';
import 'package:rend/v1.dart';
import 'package:rend/v2.dart';
import 'package:rend/v3.dart';
import 'package:rend/pic.dart';
import 'package:rend/globals.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> with SingleTickerProviderStateMixin {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  TextEditingController idNumber = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController employment = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController employmentCompany = new TextEditingController();
  TextEditingController highestEducation = new TextEditingController();
  TextEditingController maritalstate = new TextEditingController();
  String dropdownValue = 'One';
  String dropdownValue2 = 'Married';
  String holder = "";
  String holder2 = "";

  int _tabIndex = 0;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  void _toggleTab(int x) {
    _tabIndex = _tabController.index + x;
    _tabController.animateTo(_tabIndex);
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
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

    final highestEdu = DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 20,
      elevation: 10,
      style: TextStyle(color: Colors.blueAccent),
      underline: Container(
        height: 1,
        color: Colors.blueAccent,
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
    final maritalState =  DropdownButton<String>(
      value: dropdownValue2,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue2 = newValue;
          
        });
      },
      items: <String>['Married', 'single', 'x', 'widow/widower']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    final submitBtn = Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
             Api().verify(Globals.username, firstName.text,
              secondName.text, lastName.text, idNumber.text, dob.text
              ,dropdownValue,secondName.text, employment.text, employmentCompany.text, salary.text);
          },
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: ""),
              Tab(text: ""),
              Tab(text: ""),
          
            ],
          ),
          title: Text('Verification info'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Scaffold(
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
            ),
            Scaffold(
              body: SafeArea(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Education Lvl",
                                style: style,
                              ),
                              SizedBox(width:  5,),
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
                              Text(
                                "Marital status",
                                style: style,
                              ),
                              SizedBox(width: 15.0),
                              maritalState,
                            ],
                          ),
                          SizedBox(height: 200),
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
                            color: Colors.blueAccent),
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
                            Icon(Icons.navigate_next, color: Colors.blueAccent),
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

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Married';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Married', 'single', 'x', 'widow/widower']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class EduWidget extends StatefulWidget {
  EduWidget({Key key}) : super(key: key);

  @override
  _EduWidget createState() => _EduWidget();
}

class _EduWidget extends State<EduWidget> {
  String dropdownValue = 'Primary school';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 20,
      elevation: 10,
      style: TextStyle(color: Colors.blueAccent),
      underline: Container(
        height: 1,
        color: Colors.blueAccent,
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
