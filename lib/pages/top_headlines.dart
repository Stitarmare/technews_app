import 'package:flutter/material.dart';

class TopHeadline extends StatefulWidget{
  @override
  _TopHeadlineState createState() {
    // TODO: implement createState
    return _TopHeadlineState();
  }
}

class _TopHeadlineState extends State<TopHeadline>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return new Container(
        child: new Center(
          child: new Text("This is Recent News Page"),
        ),
    );
  }
}