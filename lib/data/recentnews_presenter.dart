import 'package:technews_app/data/topHeadline/recentnews_data.dart';

import 'dependency_injection.dart';
abstract class RecentNewsListViewContract{
  void onLoadRecentNewsComplete(List<RecentNews> items);
  void onLoadContractError();
}

class RecentNewsPresentor{
  RecentNewsListViewContract _view;
  RecentNewsRepository _repository;

  RecentNewsPresentor(this._view){
    _repository = new Injector().recentNewsRepository;
  }

  void loadRecentNews(){
    assert(_view != null);

    _repository.fetch()
    .then((recentNews)=>_view.onLoadRecentNewsComplete(recentNews))
    .catchError((onError){
      print(onError);
      _view.onLoadContractError();
    });
  }

}