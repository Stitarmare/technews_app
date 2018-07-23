
import 'package:technews_app/data/topHeadline/recentnews_data.dart';
import 'package:technews_app/data/topHeadline/recentnews_data_impl.dart';
import 'package:technews_app/data/topHeadline/recentnews_data_mock.dart';
import 'everythingNews/everything_data.dart';
import 'everythingNews/everything_data_mock.dart';
import 'everythingNews/everything_data_impl.dart';

enum Flavor{
  MOCK,
  PROD
}

class Injector{
  // ignore: missing_identifier
  static final Injector _singlton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor){
    _flavor = flavor;
  }

  factory Injector(){
    return _singlton;
  }

  Injector._internal();

  RecentNewsRepository get recentNewsRepository{
    switch (_flavor){
      case Flavor.MOCK: return new MockRecentNewsRepository();
      default:
        return new ImplRecentNewsRepository();
    }
  }

  EverythingNewsRepository get everythingNewsRepository{
    switch (_flavor){
      case Flavor.MOCK: return new MockEverythingRepository();
      default:
        return new ImplEverythingRepository();
    }
  }

}