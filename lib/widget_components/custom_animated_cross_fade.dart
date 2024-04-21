import 'package:flutter/material.dart';

class CustomAnimatedCrossFade extends StatelessWidget {
  final Widget firstChild;
  final Widget secondChild;
  final CrossFadeState crossFadeState;
  final Duration duration;
  final Curve curve;

  const CustomAnimatedCrossFade({
    super.key,
    required this.firstChild,
    required this.secondChild,
    required this.crossFadeState,
    this.duration = const Duration(milliseconds: 410),
    this.curve = Curves.decelerate,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState: crossFadeState,
      duration: duration,
      reverseDuration: duration,
      firstCurve: curve,
      secondCurve: curve,
      sizeCurve: curve,
    );
  }
}
