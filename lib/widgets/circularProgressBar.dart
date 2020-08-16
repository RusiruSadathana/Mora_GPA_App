import 'package:flutter/material.dart';
import 'package:mora_gpa/classes/circularProgressBarPainter.dart';

class CircularProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;
  final Widget child;
  CircularProgressBar(
      {this.backgroundColor, this.foregroundColor, this.value, this.child});
  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor;
    final foregroundColor = this.foregroundColor;
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: child,
        foregroundPainter: CircularProgressBarPainter(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            percentage: this.value,
            strokeWidth: 20),
      ),
    );
  }
}
