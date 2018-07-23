import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recentnews_data.dart';

class ImplRecentNewsRepository implements RecentNewsRepository{

  static var kRecentNewsUrl = "https://newsapi.org/v2/top-headlines?sources=engadget&apiKey=e89812d73bdc480e8c04eda742ad0de1";
  final JsonDecoder _decoder = new JsonDecoder();
  @override
  Future<List<RecentNews>> fetch() {
    // TODO: implement fetch

    return http.get(kRecentNewsUrl)
        .then((http.Response response){
          final String jsonBody = response.body;
          final statusCode = response.statusCode;

          if (statusCode < 200 || statusCode > 200 || jsonBody == null){
            throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.body}]");
          }
          final recentNewsContainer = _decoder.convert(jsonBody);
          final List recentNewsList = recentNewsContainer['articles'];

          return recentNewsList.map((recentNews)=> new RecentNews.fromMap(recentNews)).toList();
    });

  }

}