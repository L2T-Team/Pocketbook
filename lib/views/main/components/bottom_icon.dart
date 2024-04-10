import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  const BottomIcon({super.key, 
    required this.color,
    required this.imageAsset,
    required this.lineColor,
    required this.trueIndex,
  });

  final Color color;
  final Color lineColor;
  final String imageAsset;
  final int trueIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Image
        Container(
          margin: const EdgeInsets.symmetric(vertical: 9.0),
          height: 24,
          width: 24,
          alignment: Alignment.center,
          child: trueIndex == 0
              ? Image.asset(
                  imageAsset,
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  imageAsset,
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
        ),
      ],
    );
  }
}
