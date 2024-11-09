import 'package:flutter/material.dart';
import 'enums/loading_animation.dart';
import 'enums/loading_position.dart';
import 'utils/animation_helper.dart';
import 'utils/loading_alignment.dart';
import 'widgets/loading_widget.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TfkLoading {
  static final TfkLoading _instance = TfkLoading._internal();
  OverlayEntry? _overlayEntry;
  bool isVisible = false;

  TfkLoading._internal();

  factory TfkLoading() {
    return _instance;
  }

  void show({
    String? lottie,
    String? gif,
    Widget? child,
    Color backgroundColor = Colors.black54,
    double opacity = 0.7,
    LoadingPosition position = LoadingPosition.center,
    double width = 100.0,
    double height = 100.0,
    LoadingAnimation animationType = LoadingAnimation.fade,
    String? loadingText,
    TextStyle? textStyle,
    bool isDismissible = false,
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    if (isVisible) return;

    // Use the navigatorKey to get the overlay state
    final overlayState = _getOverlayState();
    if (overlayState != null) {
      _overlayEntry = _createOverlayEntry(
        lottie: lottie,
        gif: gif,
        child: child,
        backgroundColor: backgroundColor,
        opacity: opacity,
        position: position,
        width: width,
        height: height,
        animationType: animationType,
        loadingText: loadingText,
        textStyle: textStyle,
        isDismissible: isDismissible,
        animationDuration: animationDuration,
      );

      overlayState.insert(_overlayEntry!);
      isVisible = true;
    }
  }

  void hide() {
    if (isVisible && _overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      isVisible = false;
    }
  }

  OverlayEntry _createOverlayEntry({
    String? lottie,
    String? gif,
    Widget? child,
    Color backgroundColor = Colors.black54,
    double opacity = 0.7,
    LoadingPosition position = LoadingPosition.center,
    double width = 100.0,
    double height = 100.0,
    LoadingAnimation animationType = LoadingAnimation.fade,
    String? loadingText,
    TextStyle? textStyle,
    bool isDismissible = false,
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    final alignment = getAlignmentFromPosition(position);
    final loadingWidget = LoadingWidget(
      lottie: lottie,
      gif: gif,
      width: width,
      height: height,
      loadingText: loadingText,
      textStyle: textStyle,
      child: child,
    );

    return OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: isDismissible ? hide : null,
          child: Container(
            color: backgroundColor.withOpacity(opacity),
            alignment: alignment,
            child:
                applyAnimation(loadingWidget, animationType, animationDuration),
          ),
        ),
      ),
    );
  }

  OverlayState? _getOverlayState() {
    final navigatorContext = navigatorKey.currentState?.context;
    return navigatorContext != null
        ? Overlay.of(navigatorContext, rootOverlay: true)
        : null;
  }
}
