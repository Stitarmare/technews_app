import 'package:flutter/material.dart';

class RecentNews extends StatefulWidget{
  @override
  _RecentNewsState createState() {
    // TODO: implement createState
    return _RecentNewsState();
  }
}

class _RecentNewsState extends State<RecentNews>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Container(
        child: new Center(
          child: new Text("This is Recent News Page"),
        ),
    );
  }
}