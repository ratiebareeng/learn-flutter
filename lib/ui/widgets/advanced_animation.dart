import 'package:flutter/material.dart';

import './logo_image.dart';

class AdvancedAnimationPage extends StatefulWidget {
  const AdvancedAnimationPage({super.key});

  @override
  State<AdvancedAnimationPage> createState() => _AdvancedAnimationPageState();
}

class _AdvancedAnimationPageState extends State<AdvancedAnimationPage>
    with SingleTickerProviderStateMixin {
  // Provides a single [Ticker] that is configured to only tick while the current tree is enabled, as defined by [TickerMode]
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Offset> animation2;

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
      end: 1, //2 * math.pi,
    )
        .chain(CurveTween(curve: Curves.easeInOutBack))
        .animate(animationController) // curvedAnimation
      ..addStatusListener((status) {
        // rock back and forth animation
        /*  if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        } */
        // repeat animation, continous loop
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });

    animation2 = Tween<Offset>(
      begin: const Offset(
          -1, 0), // positive x offsets move the child towards the right
      end: const Offset(1, 0.0),
    ).animate(animationController);

    // Starts running this animation forwards (towards the end).
    // Returns a [TickerFuture] that completes when the animation is complete.
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return AnimatedLogoImage(animation);
    return Scaffold(
      appBar: AppBar(),
      body: SlideTransition(
        // angle: animation,
        position: animation2,
        textDirection: TextDirection.rtl,
        child: const LogoImage(),
      ),
    );
  }
}
