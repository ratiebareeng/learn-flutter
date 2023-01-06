// Animated builder
import 'package:flutter/material.dart';

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;

  const RotatingTransition(
      {required this.child, required this.angle, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: angle,
        child: child,
        builder: (context, child) {
          return Transform.rotate(
            angle: angle.value,
            child: child, // not rebuild child
          );
        });
  }
}
