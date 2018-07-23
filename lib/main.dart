import 'package:flutter/material.dart';
import 'package:technews_app/modules/home_page.dart';

void main() {


  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "NewsApp",
      home: new HomePage(),
    );
  }
}