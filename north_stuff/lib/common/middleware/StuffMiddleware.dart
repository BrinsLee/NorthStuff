import 'dart:async';
import 'package:redux/redux.dart';
import 'package:north_stuff/common/state/AppState.dart';
import 'package:north_stuff/api/Api.dart';
import 'package:north_stuff/common/actions/CommonAction.dart';
import 'package:north_stuff/utils/NetWorkUtils.dart';
import 'dart:convert';
import 'package:kt_dart/collection.dart';
import 'package:north_stuff/model/ShoesInfo.dart';

class StuffMiddleware extends MiddlewareClass<AppState> {
  StuffMiddleware();

  @override
  Future<void> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitCompleteAction) {
      await _updateShowDates(store,action, next);
    }
  }

  Future<void> _updateShowDates(Store<AppState> store,InitCompleteAction action, NextDispatcher next) async {
    next(RequestShowsAction());
    try {
      var shows = store.state.showState.info;
      if (shows.isEmpty()) {
        shows = await getNewsList();
      }
      next(ReceivedShowsAction(shows));
    }catch(e){
      next(ErrorLoadingShowsAction());
    }
  }


  Future<KtList<ShoesInfo>> getNewsList() {
    String url = Api.baseUrl + Api.baseketBall;
    NetWorkUtils.get(url).then((res) {
      if (res != null) {
        Map<String, dynamic> map = json.decode(res);
        if (map['status'] == 200) {}
        var msg = map['datas'];
        print(msg);
        return msg;
      }
      return null;
    });
  }
}
