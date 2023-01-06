import 'package:flutter/animation.dart';

extension CurveX on Curves {
  static String getCurveName(Curve curve) {
    /*  if (curvesList.contains(curve)) {
      
      return '$curve';
    }

    return curve.toString(); */

    switch (curve) {
      case Curves.fastOutSlowIn:
        return 'fastOutSlowIn';
      case Curves.slowMiddle:
        return 'slowMiddle';
      case Curves.linear:
        return 'linear';
      case Curves.bounceInOut:
        return 'bounceInOut';
      case Curves.bounceIn:
        return 'bounceIn';
      case Curves.bounceOut:
        return 'bounceOut';
      case Curves.decelerate:
        return 'decelerate';
      case Curves.ease:
        return 'ease';
      case Curves.easeIn:
        return 'easeIn';
      case Curves.easeInSine:
        return 'easeInSine';
      case Curves.easeInQuad:
        return 'easeInQuad';
      case Curves.easeInQuart:
        return 'easeInQuart';
      case Curves.easeInCubic:
        return 'easeInCubic';
      case Curves.easeInQuint:
        return 'easeInQuint';
      case Curves.easeInExpo:
        return 'easeInExpo';
      case Curves.easeInCirc:
        return 'easeInQuad';
      case Curves.easeInBack:
        return 'easeInBack';
      default:
        return curve.toString();
    }
  }
}
