import 'package:flutter/material.dart';
import 'package:north_stuff/model/ShoesInfo.dart';


class StuffGrid extends StatelessWidget {
  static const emptyViewKey = const Key('emptyView');
  static const contentKey = const Key('content');

  StuffGrid({
    @required this.listType,
    @required this.onReloadCallback,
  });

  final ShoesInfo listType;
  final VoidCallback onReloadCallback;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
