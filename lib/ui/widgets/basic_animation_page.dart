import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../extensions/curve_extension.dart';

const curvesList = {
  Curves.bounceIn,
  Curves.bounceInOut,
  Curves.bounceOut,
  Curves.decelerate,
  Curves.ease,
  Curves.easeIn,
  Curves.easeInBack,
  Curves.easeInCirc,
  Curves.easeInCubic,
  Curves.easeInExpo,
  Curves.easeInOut,
  Curves.easeInOutBack,
  Curves.easeInOutCirc,
  Curves.easeInOutCubic,
  Curves.easeInOutCubicEmphasized,
  Curves.easeInOutExpo,
  Curves.easeInOutQuad,
  Curves.easeInOutQuart,
  Curves.easeInOutQuint,
  Curves.easeInOutSine,
  Curves.easeInQuad,
  Curves.easeInQuart,
  Curves.easeInQuint,
  Curves.easeInSine,
  Curves.easeInToLinear,
  Curves.easeOut,
  Curves.easeOutBack,
  Curves.easeOutCirc,
  Curves.easeOutCubic,
  Curves.easeOutExpo,
  Curves.easeOutQuad,
  Curves.easeOutQuart,
  Curves.easeOutQuint,
  Curves.easeOutSine,
  Curves.elasticIn,
  Curves.elasticInOut,
  Curves.elasticOut,
  Curves.fastLinearToSlowEaseIn,
  Curves.fastOutSlowIn,
  Curves.linear,
  Curves.linearToEaseOut,
  Curves.slowMiddle,
};

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
  late CurvedAnimation curvedAnimation;

  Curve currentCurve = (curvesList.toList()..shuffle())
      .first; // shuffle list then get first item

  void updateCurve(Curve curve) {
    setState(() {
      currentCurve = curve; // update dropdown button value
    });
    animate(updateCurve: curve);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(
          seconds: 2), // The length of time this animation should last.
      vsync:
          this, // TickerProvider, tells controller how many frames per sec to progress towards final value
    );
    animate();
  }

  void animate({
    Curve? updateCurve, // used to update curve if using curved animation
  }) {
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: updateCurve ?? currentCurve,
      reverseCurve: updateCurve?.flipped ?? currentCurve.flipped,
    );

    // tween changes the range of the animation from 0-1 to 0-2*pi
    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    )
        .chain(
          CurveTween(
            //Can add curves by chaining them into tween
            curve: currentCurve,
          ),
        )
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
          animationController.repeat();
        } */
      });

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
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: DropdownButton<Curve>(
              items: curvesList
                  .map(
                    (curveType) => DropdownMenuItem<Curve>(
                      value: curveType,
                      child: Text(CurveX.getCurveName(curveType)),
                    ),
                  )
                  .toList(),
              onChanged: ((value) {
                if (value != null) {
                  updateCurve(value);
                }
              }),
              value: currentCurve,
            ),
          ),
          Expanded(
            flex: 8,
            child: Transform.rotate(
              angle: animation.value, // radians
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(400),
                    child: Image.asset('images/d.jpg')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
