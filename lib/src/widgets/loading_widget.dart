import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final String? lottie;
  final String? gif;
  final Widget? child;
  final double width;
  final double height;
  final String? loadingText;
  final TextStyle? textStyle;

  const LoadingWidget({
    Key? key,
    this.lottie,
    this.gif,
    this.child,
    required this.width,
    required this.height,
    this.loadingText,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator;

    if (lottie != null) {
      loadingIndicator = Lottie.asset(lottie!, width: width, height: height);
    } else if (gif != null) {
      loadingIndicator = Image.asset(gif!, width: width, height: height);
    } else if (child != null) {
      loadingIndicator = child!;
    } else {
      loadingIndicator = CircularProgressIndicator();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        loadingIndicator,
        if (loadingText != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(loadingText!, style: textStyle),
          ),
      ],
    );
  }
}
