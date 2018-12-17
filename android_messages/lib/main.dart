import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Messages App",
      theme: ThemeData(primaryColor: Colors.black),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGoingDown = true;
  _buildList() {
    return ListView(
      children: List.generate(300, (index) => "Messages ${index + 1}")
          .map((val) => ListTile(
                dense: true,
                leading: Icon(Icons.people),
                subtitle: Text(val),
                title: Text("Effie"),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (onScorllNotification) {
          if (onScorllNotification is ScrollUpdateNotification) {
            if (onScorllNotification.scrollDelta <= 0.0) {
              if (!isGoingDown)
                setState(() {
                  isGoingDown = true;
                });
              if (isGoingDown)
                setState(() {
                  isGoingDown = true;
                });
            }
          }
        },
        child: _buildList(),
      ),
      floatingActionButton: isGoingDown
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text("start chat"),
              icon: Icon(Icons.message),
              backgroundColor: Colors.black,
            )
          : FloatingActionButton(
              child: Icon(Icons.message),
              onPressed: () {},
            ),
    );
  }
}
