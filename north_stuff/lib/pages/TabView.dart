import 'package:flutter/material.dart';
import 'package:north_stuff/api/Api.dart';
import 'package:north_stuff/utils/NetWorkUtils.dart';
import 'dart:convert';

class TabView extends StatefulWidget {
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
    return Container();
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
