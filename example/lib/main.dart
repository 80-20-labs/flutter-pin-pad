import 'package:flutter/material.dart';
import 'package:pinpad/numpad_controller.dart';
import 'package:pinpad/numpad.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PinPad Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NumPadController npc = NumPadController();
  @override
  void initState() {
    super.initState();
    /* Listener for the numpad controller. */
    npc.addListener(() {
      String realCode = "1111";
      if (npc.doneTyping) {
        if (realCode != npc.code) {
          npc.wrongInputBehavior();
        }
      }
    });
  }

  /* main build method. */
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NumPad(
        /* numpad must always have a controller attached to it. */
        controller: npc,
      ),
    ); 
  }
}
