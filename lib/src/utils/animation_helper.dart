import 'package:flutter/material.dart';
import '../enums/loading_animation.dart';

Widget applyAnimation(
    Widget child, LoadingAnimation animationType, Duration duration) {
  switch (animationType) {
    case LoadingAnimation.scale:
      return ScaleTransition(scale: AlwaysStoppedAnimation(1.0), child: child);
    case LoadingAnimation.rotate:
      return RotationTransition(
        turns: AlwaysStoppedAnimation(1.0),
        child: child,
      );

    case LoadingAnimation.fade:
    default:
      return AnimatedOpacity(opacity: 1.0, duration: duration, child: child);
  }
}
