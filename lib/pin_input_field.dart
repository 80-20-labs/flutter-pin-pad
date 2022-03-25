import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class PinInputField extends StatelessWidget {
  var color, placeholderColor;
  final String? placeholder;

  PinInputField({this.color, this.placeholder, this.placeholderColor});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    /*  return Center(
      child: Transform(
        transform:
            Matrix4.translation(Provider.of<vector_math.Vector3>(context)),
        child: TextField(
          enabled: false,
          controller: Provider.of<TextEditingController>(context),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: width / 10,
            letterSpacing: 15,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: TextStyle(color: placeholderColor)
          ),
        ),
      ),
    ); */
    return Center(
      child: Transform(
        transform:
            Matrix4.translation(Provider.of<vector_math.Vector3>(context)),
        child: PinCodeTextField(
          controller: Provider.of<TextEditingController>(context),
          hideCharacter: true,
          highlight: true,
          pinBoxWidth: width * 0.1,
          hideDefaultKeyboard: true,
          wrapAlignment: WrapAlignment.spaceAround,
          pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
          pinTextAnimatedSwitcherTransition:
              ProvidedPinBoxTextAnimation.scalingTransition,
          pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
          highlightAnimationBeginColor: Colors.black,
          highlightAnimationEndColor: Colors.white12,
          keyboardType: TextInputType.none,
        ),
      ),
    );
  }
}
