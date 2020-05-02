import 'package:flutter/material.dart';
import 'package:rend/signup.dart';

class V3 extends  StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController highestEducation = new TextEditingController();
  TextEditingController maritalstate = new TextEditingController();
  TextEditingController employmentCompany = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  String dropdownValue = 'One';
  
  @override
  Widget build(BuildContext context) {
    final highestEdu = EduWidget();
    final maritalState =MyStatefulWidget();
    final loginButton = Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async { 
          },
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text("Highest education",style: style,),
                  SizedBox(width: 15.0),
                  highestEdu,],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text("Marital status",style: style,),
                  SizedBox(width: 15.0),
                  maritalState,],
                  ),
                  SizedBox(height: 200),
                  loginButton
                ]),
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
      style: TextStyle(color: Colors.blueAccent),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
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
          child: Text(value ,style: style,),
        );
      }).toList(),
    );
  }
}
