import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Draggable Widget",
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  String dataAccepted = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Widget"),
      ),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(100.0, 100.0),
          ),
          Positioned(
            top: 100,
            left: 100,
            child: DragTarget(
              builder: (context, accepted, rejected) => Container(
                    color: Colors.green,
                    height: 200,
                    width: 200,
                    child: Center(child: Text(dataAccepted.toString())),
                  ),
              onAccept: (String data) {
                dataAccepted = data;
              },
            ),
          )
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  DraggableWidget({Key key, @required this.offset});
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);
  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.offset.dy,
      left: widget.offset.dx,
      child: Draggable(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Center(
            child: Text("Hi Roy"),
          ),
        ),
        feedback: Container(
          height: 200,
          width: 200,
          color: Colors.red.withOpacity(0.4),
          child: Center(
            child: Text("Hi Roy"),
          ),
        ),
        data: "sth meaningful",
      ),
    );
  }
}
