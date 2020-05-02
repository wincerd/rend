import 'package:flutter/material.dart';
import 'package:rend/v1.dart';
import 'package:rend/v2.dart';
import 'package:rend/v3.dart';
import 'package:rend/pic.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class ParentProvider extends InheritedWidget {
  final TabController tabController;
  final Widget child;
  final String title;

  ParentProvider({
    this.tabController,
    this.child,
    this.title,
  });

   @override
  bool updateShouldNotify(ParentProvider oldWidget) {
    return true;
  }

  static ParentProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ParentProvider>();
}

class _VerifyState extends State<Verify> with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void _toggleTab(int x) {
    _tabIndex = _tabController.index + x;
    _tabController.animateTo(_tabIndex);
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: ""),
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
            V1(),
            V2(),
            // TakePictureScreen(),
            UploadImageDemo(),
            V3(),
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
                          if(_tabController.index == 0){
                           _toggleTab(0);
                          }
                          else{ _toggleTab(-1);
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
                           if(_tabController.index == 3){
                           _toggleTab(0);
                          }
                          else{
                          _toggleTab(1);
                          }

                        },
                        child:
                            Icon(Icons.navigate_next, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  TabPageSelector(controller: _tabController,),
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
