import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Widget Demo"),
      ),
      body: Column(
        children: <Widget>[RowBox(), Expanded(child: ColumnBox())],
      ),
    );
  }
}

class ColumnBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: ColorBox(color: Colors.red)),
            ColorBox(color: Colors.blue),
            Expanded(child: ColorBox(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

class RowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ColorBox(color: Colors.red),
            Expanded(child: ColorBox(color: Colors.blue)),
            ColorBox(color: Colors.green),
            // ColorBox(color: Colors.amber),
          ],
        ),
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
      margin: EdgeInsets.all(8),
      color: color,
      height: 80,
      width: 80,
    );
  }
}
