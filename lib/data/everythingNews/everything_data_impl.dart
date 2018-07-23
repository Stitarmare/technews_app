import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technews_app/data/topHeadline/recentnews_data.dart';
import 'everything_data.dart';

class ImplEverythingRepository implements EverythingNewsRepository{
  static var kRecentNewsUrl = "https://newsapi.org/v2/everything?sources=engadget&apiKey=e89812d73bdc480e8c04eda742ad0de1";
  final JsonDecoder _decoder = new JsonDecoder();
  @override
  Future<List<EverythingNews>> fetch() {
    // TODO: implement fetch

    return http.get(kRecentNewsUrl)
        .then((http.Response response){
      final String jsonBody = response.body;
      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 200 || jsonBody == null){
        throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.body}]");
      }
      final everythingContainer = _decoder.convert(jsonBody);
      final List everythingNewsList = everythingContainer['articles'];

      return everythingNewsList.map((everything)=>new EverythingNews.fromMap(everything)).toList();
    });
  }

}