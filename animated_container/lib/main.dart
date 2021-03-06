import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated Container Demo",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MyAnimate(),
    );
  }
}

class MyAnimate extends StatefulWidget {
  MyAnimateState createState() => MyAnimateState();
}

class MyAnimateState extends State<MyAnimate> {
  final List colors = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.green
  ];
  final Random random = new Random();
  Color _color;
  List<Color> _gradientColor = [Colors.red, Colors.blue];

  void changeColor() {
    setState(() {
      final newColor = colors[random.nextInt(5)];
      if (newColor != _color) {
        _color = newColor;
      }
    });
  }

  // void changeGradientColor() {
  //   setState(() {
  //     _gradientColor = [colors[random.nextInt(5)], colors[random.nextInt(5)]];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 3000),
          height: 300,
          width: 300,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: _color,
            // gradient: LinearGradient(colors: _gradientColor),
            border: Border.all(
              color: Colors.blueGrey,
              width: 5,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(5, 5),
              )
            ],
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.face),
        onPressed: () {
          changeColor();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ColorBox extends StatelessWidget {
  final color;
  ColorBox({@required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      width: 100,
    );
  }
}
