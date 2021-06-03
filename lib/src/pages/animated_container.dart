import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Animated Container")),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _cambiarForma(),
          child: Icon(Icons.play_arrow),
        ));
  }

  void _cambiarForma() {
    setState(() {
      Random number = new Random();
      _width = number.nextDouble() * 100;
      _height = number.nextDouble() * 100;
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _borderRadius = BorderRadius.circular(number.nextInt(100).toDouble());
    });
  }
}
