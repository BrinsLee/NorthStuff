import 'package:flutter/material.dart';
import 'package:north_stuff/api/Api.dart';
import 'package:north_stuff/utils/NetWorkUtils.dart';
import 'dart:convert';
import 'package:north_stuff/common/LoadingView.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/common/ProgressIndicator.dart';

class TabView extends StatefulWidget {
  TabView({this.type});

  final ShoesType type;

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final ScrollController _scrollController = ScrollController();
  var listData;
  var slideData;
  var curPage = 1;

  @override
  Widget build(BuildContext context) {
    return LoadingView(
      loadingContent: ProgressIndicators(),
      errorContent: Container() ,
      successContent: ,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listData.listTotalSize) {
        curPage++;
        getNewsList(true);
      }
    });
    getNewsList(false);
  }

  Future<Null> _pullToRefreash() async {
    curPage = 1;
    getNewsList(false);
    return null;
  }

  getNewsList(bool isLoadMore) {
    String url = Api.baseUrl + Api.baseketBall;
    NetWorkUtils.get(url).then((res) {
      if (res != null) {
        Map<String, dynamic> map = json.decode(res);
        if (map['status'] == 200) {}
        var msg = map['datas'];
        print(msg);
        setState(() {
          if (!isLoadMore) {
            listData = msg;
          }
        });
      }
    });
  }
}
