import 'package:flutter/material.dart';
import 'package:rend/statment.dart';

class AgentPage extends StatelessWidget {
  AgentPage({this.username});
  final String username;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  Widget _buildChild(int index) {
    if (index == 0) {
      return ListDemo();
  }
  //   else if (index == 1){
  //   return Blc();
  // }
  //   else if (index == 2){
  //     return Trans();
  //   }
  //   else if (index == 3){
  //     return Trans();
  //   }
  }
  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;

    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildChild(_selectedIndex)
          ),
  BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
  icon: Icon(Icons.home),
  title: Text('Home'),
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.business),
  title: Text('Accounts'),
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.school),
  title: Text('Transact'),
  ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.amber[800],
  onTap: _onItemTapped,
  ),
  ]),);
}
}