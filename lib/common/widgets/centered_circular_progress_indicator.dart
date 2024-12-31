import 'package:flutter/material.dart';

//for showing the circular progress bar in loading state of button
class CenteredCircularProgressIndicator extends StatelessWidget {
  const CenteredCircularProgressIndicator({
    super.key,
    this.height,
    this.width,
    this.strokeWidth,
    this.isCentered = true,
  });
  final double? height;
  final double? width;
  final double? strokeWidth;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return isCentered
        ? Center(
            child: SizedBox(
              height: height ?? 25,
              width: width ?? 25,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth ?? 3,
              ),
            ),
          )
        : SizedBox(
            height: height ?? 25,
            width: width ?? 25,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 3,
            ),
          );
  }
}
