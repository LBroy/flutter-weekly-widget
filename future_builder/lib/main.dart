import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      title: "Future Builder Demo",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder Demo"),
      ),
      body: Center(child: FutureWidget()),
    );
  }
}

class FutureWidget extends StatefulWidget {
  _FutureWidgetState createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text("error: ${snapshot.error}");
            } else {
              return createListView(context, snapshot);
            }
        }
      },
    );
  }

  Future<List<String>> _getData() async {
    final values = List<String>();
    values.add("Horses");
    values.add("Sth");
    values.add("Hosdafalsdf");
    await Future.delayed(Duration(seconds: 5));
    return values;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> data = snapshot.data;
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(data[index]),
            )
          ],
        );
      },
    );
  }
}
