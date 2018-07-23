import 'package:flutter/material.dart';
import 'package:technews_app/data/topHeadline/recentnews_data.dart';

class DetailScreen extends StatefulWidget{

  RecentNews recentNews;

  DetailScreen({RecentNews recentNews}){
    this.recentNews = recentNews;
  }

  @override
  _DetailScreenState createState() {
    // TODO: implement createState
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Detail news"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Image.network(widget.recentNews.urlToImage),
            new Padding(padding: const EdgeInsets.all(12.0)),
            new Text(
              "${widget.recentNews.title}",

              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
            new Text(
                "d"
            ),
          ],
        ),
      )
    );
  }
}