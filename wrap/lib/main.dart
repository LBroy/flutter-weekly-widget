import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wrap Widget Demo",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Widget Demo"),
      ),
      body: WrapWidget(),
    );
  }
}

class WrapWidget extends StatelessWidget {
  final List colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.amber
  ];
  final Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: List.generate(
            100,
            (i) => ColorBox(
                  color: colors[random.nextInt(5)],
                )),
      ),
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
      height: 80,
      width: 80,
    );
  }
}
