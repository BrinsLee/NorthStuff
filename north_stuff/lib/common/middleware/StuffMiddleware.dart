import 'dart:async';
import 'package:redux/redux.dart';
import 'package:north_stuff/common/state/AppState.dart';
import 'package:north_stuff/api/Api.dart';
import 'package:north_stuff/common/actions/CommonAction.dart';
import 'package:north_stuff/utils/NetWorkUtils.dart';
import 'dart:convert';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/model/Datas.dart';
import 'package:north_stuff/common/stuffparams/BaseData.dart';

class StuffMiddleware extends MiddlewareClass<AppState> {
  StuffMiddleware();

  @override
  Future<void> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is RequestShowsAction) {
      await _acceptShoesInfo(store, action, next);
    }
  }

  Future<void> _acceptShoesInfo(Store<AppState> store,
      RequestShowsAction action, NextDispatcher next) async {
    next(RequestShowsAction(action.params));
    try {
      var whose = action.params["name"];
      var shows = store.state.showState.info;
      if (shows == null) {
        await getNewsList(whose)
            .then((value) => next(ReceivedShowsAction(value)));
      }
    } catch (e) {
      next(ErrorLoadingShowsAction());
    }
  }

  Future<List<ShoesInfo>> getNewsList(BaseData params) async {
    String url = Api.baseUrl + Api.baseketBall;
    print(url);
    //http://www.shihuo.cn/sports/getStyles?style_id=361388&goods_id=221380
    var res = await NetWorkUtils.get(url, <String,String>{"style_id": params.style_id,"goods_id": params.goods_id});
    if (res != null) {
      Map<String, dynamic> map = json.decode(res);
      if (map['status'] == 200) {
        Datas datas = Datas.fromJson(map);
        return datas.datas;
      }
      return null;
    }

    return null;
  }
}
