import 'package:flutter/material.dart';
import 'package:north_stuff/common/LoadingView.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/common/ProgressIndicator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:north_stuff/common/state/AppState.dart';
import 'package:north_stuff/model/TabViewModel.dart';
import 'package:north_stuff/common/SruffGrid.dart';
import 'package:north_stuff/common/actions/CommonAction.dart';
import 'package:north_stuff/common/stuffparams/StuffParams.dart';

class TabView extends StatefulWidget {
  TabView({this.type, this.params});

  final ShoesType type;
  final StuffParams params;

  @override
  _TabViewState createState() => _TabViewState(params);
}

class _TabViewState extends State<TabView> with AutomaticKeepAliveClientMixin {
  _TabViewState(this.params);
  final ScrollController _scrollController = ScrollController();
  var listData;
  var slideData;
  var curPage = 1;
  final StuffParams params;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,TabViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(RequestShowsAction(params.params)),
      converter: (store) => TabViewModel.fromStore(store),
      builder: (_, viewModle) => EventPageContent(viewModle),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollerListener);
  }

  void _scrollerListener() {
    var maxScroll = _scrollController.position.maxScrollExtent;
    var pixels = _scrollController.position.pixels;
    if (maxScroll == pixels && listData.length < listData.listTotalSize) {
      curPage++;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollerListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;


}

class EventPageContent extends StatelessWidget{

  EventPageContent(this.model);
  final TabViewModel model;

  @override
  Widget build(BuildContext context) {
    return LoadingView(
      status: model.status,
      loadingContent: ProgressIndicators(),
      errorContent: Container(child: Text("loading failed"),),
      successContent: StuffGrid(
        stuffInfo: model.events,
      ),
    );
  }

}
