import 'package:flutter/material.dart';
import '../enums/loading_position.dart';

Alignment getAlignmentFromPosition(LoadingPosition position) {
  switch (position) {
    case LoadingPosition.top:
      return Alignment.topCenter;
    case LoadingPosition.bottom:
      return Alignment.bottomCenter;
    case LoadingPosition.topLeft:
      return Alignment.topLeft;
    case LoadingPosition.topRight:
      return Alignment.topRight;
    case LoadingPosition.bottomLeft:
      return Alignment.bottomLeft;
    case LoadingPosition.bottomRight:
      return Alignment.bottomRight;
    case LoadingPosition.center:
    default:
      return Alignment.center;
  }
}
