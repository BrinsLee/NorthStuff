import 'dart:async';
import 'package:redux/redux.dart';
import 'package:north_stuff/common/state/AppState.dart';
import 'package:north_stuff/api/Api.dart';
import 'package:north_stuff/common/actions/CommonAction.dart';
import 'package:north_stuff/utils/NetWorkUtils.dart';
import 'dart:convert';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/model/Datas.dart';

class StuffMiddleware extends MiddlewareClass<AppState> {
  StuffMiddleware();

  @override
  Future<void> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitCompleteAction) {
      await _updateShowDates(store, action, next);
    }
  }

  Future<void> _updateShowDates(Store<AppState> store,
      InitCompleteAction action, NextDispatcher next) async {
    next(RequestShowsAction());
    try {
      var shows = store.state.showState.info;
      if (shows == null) {
        await getNewsList().then((value) => next(ReceivedShowsAction(value)));
      }
    } catch (e) {
      next(ErrorLoadingShowsAction());
    }
  }

  Future<List<ShoesInfo>> getNewsList() async {
    String url = Api.baseUrl + Api.baseketBall;
    print(url);
    //http://www.shihuo.cn/sports/getStyles?style_id=361388&goods_id=221380
    var res = await NetWorkUtils.get(
        url, <String, String>{'style_id': '361388', 'goods_id': '221380'});
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
