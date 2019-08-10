import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as vector_math;
import 'package:flutter/services.dart';

import './pin_input_field.dart';
import './numpad_keyboard.dart';
import './numpad_controller.dart';



/* Numpad widget */
class NumPad extends StatefulWidget {
  final TextEditingController pinInputController = TextEditingController();

  /* Constructor Parameters. */
  final NumPadController controller;
  final backgroundColor, keyColor, clearKeyColor, backKeyColor, pinInputFieldColor, numPadContentColor;
  final int pinInputLength; // Limit how many characters can be typed.
  final String pinPlaceholder;

  NumPad({
    @required this.controller,
    this.backgroundColor = Colors.blue,
    this.keyColor = Colors.black26,
    this.clearKeyColor = Colors.black38,
    this.backKeyColor = Colors.black38,
    this.numPadContentColor = Colors.white,
    this.pinInputFieldColor = Colors.black,
    this.pinInputLength = 5,
    this.pinPlaceholder,
  });

  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animation;
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() => setState(() {}));
    animation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(animationController)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          widget.controller.doneTyping=false;

          animationController.reset();
          widget.pinInputController.clear();

          widget.controller.code = widget.pinInputController.text;
        }
      });
    /* Local reference to the global text editing controller. */
    TextEditingController inputController = widget.pinInputController;
    int pinInputLength = widget.pinInputLength;

    inputController.addListener(() {
      widget.controller.code = inputController.text;
      if (inputController.text.length >= pinInputLength) {
        widget.controller.doneTyping = true;
      };
    });

    widget.controller.shakeAnimation = animationController;
  }
  vector_math.Vector3 _shake() {
    double progress = animationController.value;
    double offset = sin(progress * pi * 800000.0);
    offset = double.parse(offset.toStringAsFixed(2));

    return vector_math.Vector3(offset * 10, 0.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Container(
          /* Input text field at the top where the PIN input is displayed. */
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
            child: ListenableProvider<TextEditingController>.value(
                value: widget.pinInputController,
                child: Center(
                  
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /* Pin Input Field Container */
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
                          child: Provider<vector_math.Vector3>.value(
                            value: _shake(),
                            child: PinInputField(
                              placeholder: widget.pinPlaceholder,
                              color: widget.pinInputFieldColor,
                            )
                          ),
                        )
                      ),
                      /* Numpad Keyboard Container. */
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: NumPadKeyboard(
                          keyColor: widget.keyColor,
                          clearKeyColor: widget.clearKeyColor,
                          backKeyColor: widget.backKeyColor,
                          keyContentColor: widget.numPadContentColor,
                          pinInputController: widget.pinInputController,
                          pinInputLength: widget.pinInputLength,
                          numPadController: widget.controller,
                        ),
                      )
                    ],
                )
              )
            )
          )
      )
    );
  }
}

