import 'package:flutter/material.dart';
import 'package:technews_app/data/everythingNews/everything_data.dart';
import 'package:technews_app/data/recentnews_presenter.dart';
import 'package:technews_app/data/topHeadline/recentnews_data.dart';
import 'package:technews_app/data/everythingNews_presenter.dart';

class MainPage extends StatefulWidget{



  @override
  _MainPageState createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> implements RecentNewsListViewContract,EverythingNewsViewContract{

   ScrollController _scrollController;
   RecentNewsPresentor _presentor;
   List<RecentNews> _recentnews;
   EverythingNewsPresenter _everyPresentor;
   List<EverythingNews> _everythingNews;

   bool _isLoading;
   bool _isLoadingEv;
   _MainPageState(){
     _presentor = new RecentNewsPresentor(this);
     _everyPresentor = new EverythingNewsPresenter(this);
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    _isLoadingEv = true;
    _presentor.loadRecentNews();
    _scrollController = new ScrollController();
    
   }


    @override
    Widget build(BuildContext context) {


     Widget horizontalNewsWidget;

     if (_isLoading){
       horizontalNewsWidget = new Center(
         child: new Padding(
           padding: const EdgeInsets.only(left: 16.0,right: 16.0),
           child: new CircularProgressIndicator(),
         ),
       );
     }else{
       horizontalNewsWidget = new Container(
         height: 200.0,
         child: new ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: _recentnews.length,
             itemBuilder: (BuildContext context,int index){
               return horizontalContainer(300.0,_recentnews[index]);
             }
         ),
       );
     }



      var newsList = <Widget>[];
      if(_isLoadingEv == true){
       var sWidget = new Center(
          child: new Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            child: new CircularProgressIndicator(),
          ),
        );
        newsList.add(sWidget);
      }else{
        for (var i = 0; i < _everythingNews.length; i++) {
          newsList.add(
              new Container(
                height: 100.0,
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: <Widget>[
                    new Image.network(
                      _everythingNews[i].urlToImage,
                      width: 100.00,
                    ),
                    new Expanded(
                      child:  new Text(
                        _everythingNews[i].title,
                        softWrap: true,
                      ),
                    ),

                  ],
                ),
              )
          );
        }
      }

    // TODO: implement build
    return  new ListView(
      children: <Widget>[
        new Text(
            "Top Headline",
          style: new TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        horizontalNewsWidget,
        new Text(
          "Recent news",
          style: new TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        ),
        // ignore: list_element_type_not_assignable
       new Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: newsList,
       )
      ],
    );
}

  

Widget horizontalContainer(double _width,RecentNews recentNews){
  return new GestureDetector(
    child: new Container(
      width: _width,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Column(
          children: <Widget>[
            Image.network(
              recentNews.urlToImage,
                  fit: BoxFit.cover,
            ),
            new Text(
                "${recentNews.title}",
              style: new TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: ()=>_onTapHorizontalContainer(recentNews),
  );
}

void _onTapHorizontalContainer(RecentNews recentNews){

}
  @override
  void onLoadContractError() {
    // TODO: implement onLoadContractError


  }

  @override
  void onLoadRecentNewsComplete(List<RecentNews> items) {
    // TODO: implement onLoadRecentNewsComplete
    setState(() {
      _recentnews = items;
      _isLoading = false;

      _everyPresentor.loadEverythingNews();
    });
  }

  @override
  void onLoadEverythingNewsComplete(List<EverythingNews> items) {
    // TODO: implement onLoadEverythingNewsComplete
    setState(() {
      _everythingNews = items;
      _isLoadingEv = false;
    });
  }

}