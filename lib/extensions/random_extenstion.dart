import 'dart:math';

import 'package:flutter/cupertino.dart';

/// Generates a non-negative random integer with a specified number of digits.
/// Supports [digitCount] values between 1 and 9 inclusive.
/// supports [digitCount] of 10 only
extension RandomX on Random {
  int nextIntOfDigits(int digitCount) {
    //assert(1 <= digitCount && digitCount <= 9);
    assert(digitCount == 10);
    // int min = digitCount == 1 ? 0 : pow(10, digitCount - 1);
    int min = pow(10, digitCount - 1).toInt();
    int max = pow(10, digitCount).toInt();
    return min + nextInt(max - min);
  }
}

int randomNumbers() {
  final random = Random();
  // Generate a random 10-digit number.
  final number = random.nextInt(900000000) + 1000000000;

  return number;
}

void reportError() => FlutterError.reportError(
      FlutterErrorDetails(
          exception: Exception('An Exception'), library: 'TFT App'),
    );

int? get vehicleControlNumber {
  return int.tryParse(
      DateTime.now().year.toString() + randomNumbers().toString());
}
