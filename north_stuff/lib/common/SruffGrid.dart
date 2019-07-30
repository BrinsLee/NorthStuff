import 'package:flutter/material.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:kt_dart/collection.dart';
import 'package:north_stuff/common/StuffGridItem.dart';

class StuffGrid extends StatelessWidget {
  static const emptyViewKey = const Key('emptyView');
  static const contentKey = const Key('content');

  StuffGrid({
    @required this.stuffInfo,
    this.onReloadCallback,
  });

  final KtList<ShoesInfo> stuffInfo;
  final VoidCallback onReloadCallback;

  @override
  Widget build(BuildContext context) {
    if (stuffInfo.isEmpty()) {
      return Container();
    }
    return _Content(stuffInfo);
  }
}

class _Content extends StatelessWidget {
  _Content(this.stuffInfo);

  final KtList<ShoesInfo> stuffInfo;

  _openDetails(BuildContext context, int index) {}

  Widget _buildItem(BuildContext context, int index) {
    final event = stuffInfo[index];
    return StuffGridItem(
      info: event,
      onTapped: () => _openDetails(context, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final crossAxisChildCount = isPortrait ? 2 : 4;

    return Container(
      child: Scrollbar(
          child: GridView.builder(
              padding: EdgeInsets.only(bottom: 50.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisChildCount,
                childAspectRatio: 2 / 3,
              ),
              itemCount: stuffInfo.size,
              itemBuilder: _buildItem)),
    );
  }
}
