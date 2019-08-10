
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class NumPadController extends ChangeNotifier {
  bool _doneTyping = false;
  String _code;
  static AnimationController shakeAnimation;

  /* Shakes pin input field then clears once animation is done. */
  void wrongInputBehavior() {
    shakeAnimation.forward();
    // if (Vibration.hasVibrator() != null) {
    //   Vibration.vibrate();
    // }
  }

  set code(code) {
    _code = code;
    notifyListeners();
  }

  set doneTyping(doneTyping) {
    _doneTyping = doneTyping;
    notifyListeners();
  }

  String get code => _code;
  bool get doneTyping =>_doneTyping;
}