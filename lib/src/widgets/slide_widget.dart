import 'dart:math';

import 'package:flutter/material.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({
    super.key,
    required this.index,
    required this.actualIndex,
    required this.sliderDuration,
    required this.item,
    // required this.isAssets,
    // required this.imageLink,
    // required this.imageFitMode,
    // required this.imageRadius,
    required this.sidesOpacity,
    required this.turns,
    required this.currentItemShadow,
    required this.sideItemsShadow,
    required this.onSlideClick,
  });

  final Function onSlideClick;

  final int index;
  final int actualIndex;
  final Duration sliderDuration;
  // final bool isAssets;
  final Widget item;
  // final BoxFit imageFitMode;
  // final double imageRadius;
  final double sidesOpacity;
  final double turns;
  final List<BoxShadow>? currentItemShadow;
  final List<BoxShadow>? sideItemsShadow;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _getSlideTurn(index, actualIndex),
      duration: sliderDuration,
      child: AnimatedContainer(
        duration: sliderDuration,
        margin: (index == actualIndex)
            ? const EdgeInsets.only(left: 8, right: 8, top: 6)
            : const EdgeInsets.only(left: 32, right: 32, top: 16),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(imageRadius),
          boxShadow: _getSlideBoxShadow(index, actualIndex),
        ),
        child: AnimatedOpacity(
          duration: sliderDuration,
          opacity: (index == actualIndex) ? 1 : sidesOpacity,
          child: GestureDetector(
            onTap: () => onSlideClick(),
            child: Container(
              child: item,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(imageRadius),
              //   image: DecorationImage(
              //     image: (!isAssets)
              //         ? NetworkImage(imageLink)
              //         : AssetImage(imageLink) as ImageProvider,
              //     fit: imageFitMode,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }

  List<BoxShadow>? _getSlideBoxShadow(index, actualIndex) =>
      (index == actualIndex) ? currentItemShadow : sideItemsShadow;

  double _getSlideTurn(int currentIndex, actualCurrentIndex) =>
      (currentIndex < actualCurrentIndex)
          ? -pi / turns
          : (currentIndex > actualCurrentIndex)
              ? pi / turns
              : 0;
}
