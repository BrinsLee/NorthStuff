import 'package:flutter/material.dart';
import 'package:north_stuff/utils/ThemeUtils.dart';
import 'package:north_stuff/common/TabView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller

  List tabs = ["James", "Durant", "Harden"];
  List<Widget> tabviewList = [TabView(), TabView(), TabView()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Container(
        height: 38.0,
        child: TabBar(
          indicatorColor: ThemeUtils.currentColorTheme,
          controller: _tabController,
          tabs: tabs.map((f) => Tab(text: f)).toList(),
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [tabviewList[0], tabviewList[1], tabviewList[2]],
        ),
      ),
    ]));
  }
}
