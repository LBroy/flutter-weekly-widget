import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Opacity Demo",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity Demo"),
      ),
      body: OpacityWidget(),
    );
  }
}

class OpacityWidget extends StatefulWidget {
  OpacityWidgetState createState() => OpacityWidgetState();
}

class OpacityWidgetState extends State<OpacityWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              "https://i.pinimg.com/564x/64/b6/47/64b647296b5f81b62de2481e6ae28cdc.jpg",
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 2,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              colorBlendMode: BlendMode.modulate,
              // width: MediaQuery.of(context).size.width / 2,
            ),
            Opacity(
              opacity: 0.2,
              child: ColorBox(),
            ),
            ColorBox(),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.purpleAccent,
      ),
    );
  }
}
