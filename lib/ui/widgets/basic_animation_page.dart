import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  // Provides a single [Ticker] that is configured to only tick while the current tree is enabled, as defined by [TickerMode]
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(
          seconds: 2), // The length of time this animation should last.
      vsync:
          this, // TickerProvider, tells controller how many frames per sec to progress towards final value
    );

    /*  final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceOut,
    ); */

    // tween changes the range of the animation from 0-1 to 0-2*pi
    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    )
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(animationController) // curvedAnimation
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        // rock back and forth animation
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
        // repeat animation, continous loop
        /* if (status == AnimationStatus.completed) {
          _animationController.repeat();
        } */
      });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
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
