import 'package:flutter/material.dart';
import 'package:north_stuff/model/ShoesInfo.dart';

class StuffDetailPage extends StatefulWidget {

  StuffDetailPage(this.shoesInfo);
  final ShoesInfo shoesInfo;

  @override
  _StuffDetailPageState createState() => _StuffDetailPageState();

}

class _StuffDetailPageState extends State<StuffDetailPage> {

  ScrollController _controller;


  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {

  }


  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

