import 'dart:ui';

import 'package:flutter/material.dart';

class TabIndicator extends StatelessWidget {
  final int length;
  final double currentIndex;
  final void Function(int) onTapIndicator;

  const TabIndicator({
    Key? key,
    required this.length,
    required this.currentIndex,
    required this.onTapIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 6,
      // margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemCount: length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTapIndicator(index),
            child: Builder(
              builder: (context) {
                double t = 0;
                if (index != 0) {
                  t = (currentIndex - index).abs().clamp(0, 1).toDouble();
                } else {
                  if (currentIndex > length - 1) {
                    t = (currentIndex - length).abs().clamp(0, 1).toDouble();
                  } else {
                    t = (currentIndex - index).abs().clamp(0, 1).toDouble();
                  }
                }
                return Container(
                  decoration: BoxDecoration(
                    color: Color.lerp(Theme.of(context).primaryColor,
                        Theme.of(context).disabledColor, t),
                    borderRadius: BorderRadiusDirectional.circular(6),
                  ),
                  // width: 24,
                  width: lerpDouble(24, 6, t),
                  height: 6,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
