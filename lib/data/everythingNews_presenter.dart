import 'package:technews_app/data/dependency_injection.dart';

import 'everythingNews/everything_data.dart';

abstract class EverythingNewsViewContract{
  void onLoadEverythingNewsComplete(List<EverythingNews> items);
  void onLoadContractError();
}


class EverythingNewsPresenter{
  EverythingNewsViewContract _view;
  EverythingNewsRepository _repository;

  EverythingNewsPresenter(this._view){
    _repository = new Injector().everythingNewsRepository;
  }

  void loadEverythingNews(){
    assert(_view != null);

    _repository.fetch()
        .then((everythingNews)=>_view.onLoadEverythingNewsComplete(everythingNews))
        .catchError((onError){
      print(onError);
      _view.onLoadContractError();
    });
  }
}