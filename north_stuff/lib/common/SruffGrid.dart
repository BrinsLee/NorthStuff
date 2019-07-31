import 'package:flutter/material.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/common/StuffGridItem.dart';

class StuffGrid extends StatelessWidget {
  static const emptyViewKey = const Key('emptyView');
  static const contentKey = const Key('content');

  StuffGrid({
    @required this.stuffInfo,
    this.onReloadCallback,
  });

  final List<ShoesInfo> stuffInfo;
  final VoidCallback onReloadCallback;

  @override
  Widget build(BuildContext context) {
    if (stuffInfo == null) {
      return Container(child: Text("加载失败"),);
    }
    return _Content(stuffInfo);
  }
}

class _Content extends StatelessWidget {
  _Content(this.stuffInfo);

  final List<ShoesInfo> stuffInfo;

  _openDetails(BuildContext context, ShoesInfo event) {
//    Navigator.push(context, MaterialPageRoute(builder: (_) => ),
  }

  Widget _buildItem(BuildContext context, int index) {
    final event = stuffInfo[index];
    return StuffGridItem(
      info: event,
      onTapped: () => _openDetails(context, event),
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
              itemCount: stuffInfo.length,
              itemBuilder: _buildItem)),
    );
  }
}
