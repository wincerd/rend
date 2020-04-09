import 'package:flutter/material.dart';

enum _MaterialListType {
  oneLine,
  oneLineWithAvatar,
  twoLine,
  threeLine,
}

class ListDemo extends StatefulWidget {
  const ListDemo({Key key}) : super(key: key);
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  _MaterialListType _itemType = _MaterialListType.threeLine;
  bool _dense = true;
  bool _showAvatars = true;
  bool _showIcons = false;
  bool _showDividers = true;
  bool _reverseSort = false;
  List<String> items = <String>[
    '10',
    '20',
    '30',
    '40',
    '23',
    '35',
    '45',
    '67',
    '80',
    '100',
    '24',
    '25',
    '2',
    '3',
  ];

  Widget buildListTile(BuildContext context, String item) {
    Widget secondary;
    if (_itemType == _MaterialListType.twoLine) {
      secondary = const Text('Additional item information.');
    } else if (_itemType == _MaterialListType.threeLine) {
      secondary = const Text(
        'Even more additional list item information appears on line three.',
      );
    }
    return MergeSemantics(
      child: ListTile(
        isThreeLine: _itemType == _MaterialListType.threeLine,
        dense: _dense,
        leading: _showAvatars
            ? ExcludeSemantics(
                child: CircleAvatar(
                  child: Text(item),
                ),
              )
            : null,
        title: Text('Transaction $item.'),
        subtitle: secondary,
        trailing: _showIcons
            ? Icon(Icons.info, color: Theme.of(context).disabledColor)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String layoutText = _dense ? ' \u2013 Dense' : '';
    String itemTypeText = 'Three-line';
    Iterable<Widget> listTiles =
        items.map<Widget>((String item) => buildListTile(context, item));
    if (_showDividers)
      listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return Material(
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
                accountName: Text('Trevor Widget'),
                accountEmail: Text('trevor.widget@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/profie.jpeg"),
                ),
              ),
              SizedBox(height: 250),
              ListTile(
                title: Text("Logout"),
                onTap: () {},
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "start",
            style: TextStyle(color: Colors.blueGrey),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.sort_by_alpha),
              tooltip: 'Sort',
              onPressed: () {
                setState(() {
                  _reverseSort = !_reverseSort;
                  items.sort((String a, String b) =>
                      _reverseSort ? b.compareTo(a) : a.compareTo(b));
                });
              },
            ),
          ],
        ),
//      appBar: AppBar(
//        title: Text('Scrolling list\n$itemTypeText$layoutText'),
//        actions: <Widget>[
//          IconButton(
//            icon: const Icon(Icons.sort_by_alpha),
//            tooltip: 'Sort',
//            onPressed: () {
//              setState(() {
//                _reverseSort = !_reverseSort;
//                items.sort((String a, String b) =>
//                    _reverseSort ? b.compareTo(a) : a.compareTo(b));
//              });
//            },
//          ),
//        ],
//      ),
        body: Scrollbar(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: _dense ? 4.0 : 8.0),
            children: listTiles.toList(),
          ),
        ),
      ),
    );
  }
}
