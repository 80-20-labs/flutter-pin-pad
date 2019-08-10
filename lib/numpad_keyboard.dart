import 'package:flutter/material.dart';
import './numpad_controller.dart';

class NumPadKeyboard extends StatelessWidget {
  var clearKeyColor, backKeyColor, keyColor, keyContentColor;
  final int pinInputLength;
  final TextEditingController pinInputController;
  final NumPadController numPadController;

  NumPadKeyboard({
    this.pinInputLength = 5,
    this.clearKeyColor, this.backKeyColor = Colors.black38,
    this.keyColor=Colors.black26,
    this.keyContentColor=Colors.white,
    @required this.pinInputController, this.numPadController,
  });
  
  @override 
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumPadKey(
                digit: '1',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength) 
                      pinInputController.text += '1';
                },
              ),
              NumPadKey(
                digit: '2',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '2';
                },
              ),
              NumPadKey(
                digit: '3',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '3';
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumPadKey(
                digit: '4',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '4';
                },
              ),
              NumPadKey(
                digit: '5',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '5';
                },
              ),
              NumPadKey(
                digit: '6',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '6';
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumPadKey(
                digit: '7',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '7';
                },
              ),
              NumPadKey(
                digit: '8',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '8';
                },
              ),
              NumPadKey(
                digit: '9',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '9';
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumPadKey(
                  digit: Icon(
                    Icons.backspace,
                    size: 20,
                    color: Colors.white,
                  ),
                  keyColor: backKeyColor,
                  keyContentColor: keyContentColor,
                  onPressed: () {
                    String text =
                        pinInputController.text;
                    int length = text.length;
                    pinInputController.text =
                        text.substring(0, length - 1);
              }),
              NumPadKey(
                digit: '0',
                keyColor: keyColor,
                keyContentColor: keyContentColor,
                onPressed: () {
                    if (pinInputController.text.length < pinInputLength)
                      pinInputController.text += '0';
                },
              ),
              NumPadKey(
                  digit: Icon(
                    Icons.clear,
                    size: 20,
                    color: Colors.white,
                  ),
                  keyColor: clearKeyColor,
                  keyContentColor:
                      keyContentColor,
                  onPressed: () {
                    numPadController.shakeAnimation.forward();
                    pinInputController.clear();
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class NumPadKeyContent extends StatelessWidget {
  var content, color;

  NumPadKeyContent({this.content, this.color});

  @override
  Widget build(BuildContext context) {
    if (content is String) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          content,
          style: TextStyle(
              fontSize: 25, color: color, fontWeight: FontWeight.normal),
        ),
      );
    } else if (content is Icon) {
      return Container(
        alignment: Alignment.center,
        child: content,
      );
    }
    return null;
  }
}

class NumPadKey extends StatelessWidget {
  var digit;
  var keyColor, keyContentColor;
  final Function onPressed;

  NumPadKey(
      {this.digit, this.keyColor, this.keyContentColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    double margin = 15.0;

    var size = (height / 1.75 - 6 * height/15 - 35);
    return Container(
      child: FittedBox(
          fit: BoxFit.cover,
          child: FlatButton(
            padding: EdgeInsets.all(margin),
            color: keyColor,
            shape: CircleBorder(),
            child: NumPadKeyContent(content: digit, color: keyContentColor),
            /* Append new digit to current text string. */
            onPressed: onPressed,
          )),
      margin: EdgeInsets.fromLTRB(margin-3, margin - 11, margin, margin - 11),
      height: size + 10,
      width: size + 10,
    );
  }
}
