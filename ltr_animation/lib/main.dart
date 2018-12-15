import 'package:flutter/material.dart';
import 'package:ltr_animation/brick_animate.dart';

void main() => runApp(MaterialApp(
      title: "left to right animation",
      home: BrickPage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    _animation = Tween(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        } else if (status == AnimationStatus.dismissed) {
          // _animationController.forward();
        }
      });
    // _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Left to Right"),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform(
              transform: Matrix4.translationValues(
                  _animation.value * screenWidth, 0.0, 0.0),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                ),
              ),
            ),
      ),
    );
  }
}
