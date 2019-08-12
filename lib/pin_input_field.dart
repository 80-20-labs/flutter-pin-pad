import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class PinInputField extends StatelessWidget {
  var color, placeholderColor;
  final String placeholder;

  PinInputField({this.color, this.placeholder, this.placeholderColor});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return Center(
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
    );
  }
}
