import 'package:flutter/material.dart';
import 'package:north_stuff/model/ShoesInfo.dart';
import 'package:north_stuff/assets.dart';
import 'package:north_stuff/common/widget_utils.dart';

class ShoesPoster extends StatelessWidget {

  ShoesPoster({this.event, this.size});

  final ShoesInfo event;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[
    ];
    addIfNonNull(_buildPosterImage(), content);
    print("pic:"+ event.pic);
    return Container(
      decoration: _buildDecorations(),
      width: size?.width,
      height: size?.height,
      child: Stack(
        alignment: Alignment.center,
        children: content,
      ),
    );
  }

  Widget _buildPosterImage() =>
      event.pic != null
          ? FadeInImage.assetNetwork(
        placeholder: ImageAssets.transparentImage,
        image: "http:"+ event.pic,
        width: size?.width,
        height: size?.height,
        fadeInDuration: const Duration(milliseconds: 300),
        fit: BoxFit.cover,
      ) : null;
}

_buildDecorations() {
  return const BoxDecoration
    (
      boxShadow: [
        BoxShadow(
            offset: Offset(1.0, 1.0),
            spreadRadius: 1.0,
            blurRadius: 2.0,
            color: Colors.black38
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color(0xFF222222),
          Color(0xFF424242),
        ],
      )
  );
}
