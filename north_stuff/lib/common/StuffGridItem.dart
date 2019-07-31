import 'package:flutter/material.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/common/ShoesPoster.dart';

class StuffGridItem extends StatelessWidget {
  final ShoesInfo info;
  final VoidCallback onTapped;

  StuffGridItem({this.info, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ShoesPoster(
            event: info,
          ),
          _TextualInfo(info),
        ],
      ),
    );
  }
}

class _TextualInfo extends StatelessWidget {
  _TextualInfo(this.info);

  final ShoesInfo info;

  BoxDecoration _buildGradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.0, 0.7, 0.7],
        colors: [
          Colors.black54,
          Colors.transparent,
          Colors.transparent,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildGradientBackground(),
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: _TextualInfoContent(info),
    );
  }
}

class _TextualInfoContent extends StatelessWidget {
  _TextualInfoContent(this.event);

  final ShoesInfo event;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
