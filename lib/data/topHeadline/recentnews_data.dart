import 'dart:async';

class RecentNews{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;


  // ignore: const_constructor_with_non_final_field
  const RecentNews({this.title,this.description,this.urlToImage,this.url,this.publishedAt,this.author});

  RecentNews.fromMap(Map<String,dynamic> map):
      title = map['title'],
  description = map['description'],
  urlToImage = map['urlToImage'],
  url = map['url'],
  publishedAt = map['publishedAt'],
  author = map['author'];


}

abstract class RecentNewsRepository{
  Future<List<RecentNews>> fetch();
}

class FetchDataException implements Exception{
  String _message;
  FetchDataException(this._message);

  @override
  String toString() {
    // TODO: implement toString
    return "Exception $_message";
  }
}