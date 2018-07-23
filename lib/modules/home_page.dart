import 'package:flutter/material.dart';
import 'package:technews_app/pages/main_page.dart';
import 'package:technews_app/pages/recent_news.dart';
import 'package:technews_app/pages/top_headlines.dart';

class DrawerItem{
  String title;
  IconData icon;

  DrawerItem(this.title,this.icon);

}


class HomePage extends StatefulWidget{

  final drawerItems = [
    new DrawerItem("Home Page", Icons.rss_feed),
    new DrawerItem("Recent News", Icons.local_pizza),
    new DrawerItem("Top News", Icons.info)
  ];

  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MainPage();
      case 1:
        return new RecentNews();
      case 2:
        return new TopHeadline();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Container(
              height: 150.0,
              color: Colors.indigo,
            ),
            new Column(children: drawerOptions,)
          ],
        ),
      ),
    );
  }
}