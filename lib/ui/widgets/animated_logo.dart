// Animated widget
import 'package:flutter/material.dart';

class AnimatedLogoImage extends AnimatedWidget {
  const AnimatedLogoImage(Animation<double> animation, {super.key})
      : super(
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final animation = super.listenable as Animation<double>;
    return Transform.rotate(
      // Creates a widget that transforms its child using a rotation around the center.
      angle: animation.value, // radians
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(400),
            child: Image.asset('images/d.jpg')),
      ),
    );
  }
}
