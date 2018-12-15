import 'package:flutter/material.dart';
import "dart:math" as math;

class BrickPage extends StatefulWidget {
  @override
  _BrickPageState createState() => _BrickPageState();
}

class _BrickPageState extends State<BrickPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween tween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    tween = Tween(
      begin: 0.0,
      end: 1.0,
    );

    _animationController.repeat();
  }

  Animation get animOne => tween.animate(
        CurvedAnimation(
          curve: Interval(0.0, 0.125),
          parent: _animationController,
        ),
      );
  Animation get animTwo => tween.animate(
        CurvedAnimation(
          curve: Interval(0.125, 0.25),
          parent: _animationController,
        ),
      );
  Animation get animThree => tween.animate(
        CurvedAnimation(
          curve: Interval(0.25, 0.375),
          parent: _animationController,
        ),
      );
  Animation get animFour => tween.animate(
        CurvedAnimation(
          curve: Interval(0.375, 0.5),
          parent: _animationController,
        ),
      );
  Animation get animFive => tween.animate(
        CurvedAnimation(
          curve: Interval(0.5, 0.625),
          parent: _animationController,
        ),
      );
  Animation get animSix => tween.animate(
        CurvedAnimation(
          curve: Interval(0.625, 0.750),
          parent: _animationController,
        ),
      );
  Animation get animSeven => tween.animate(
        CurvedAnimation(
          curve: Interval(0.75, 0.875),
          parent: _animationController,
        ),
      );
  Animation get animEight => tween.animate(
        CurvedAnimation(
          curve: Interval(0.875, 1.0),
          parent: _animationController,
        ),
      );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brick Animation"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBrick(
              animations: [animOne, animTwo],
              controller: _animationController,
              alignment: Alignment.centerLeft,
              isClockWise: true,
              marginLeft: 0.0,
            ),
            AnimatedBrick(
              animations: [animThree, animEight],
              controller: _animationController,
              isClockWise: false,
              marginLeft: 0.0,
            ),
            AnimatedBrick(
              animations: [animFour, animSeven],
              controller: _animationController,
              isClockWise: true,
              marginLeft: 30.0,
            ),
            AnimatedBrick(
              animations: [animFive, animSix],
              controller: _animationController,
              isClockWise: false,
              marginLeft: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBrick extends AnimatedWidget {
  final AnimationController controller;
  final List<Animation> animations;
  final double marginLeft;
  final Alignment alignment;
  final bool isClockWise;
  AnimatedBrick(
      {Key key,
      this.controller,
      this.animations,
      this.marginLeft,
      this.alignment = Alignment.centerRight,
      this.isClockWise})
      : super(key: key, listenable: controller);

  Matrix4 clockWise(Animation animation) =>
      Matrix4.rotationZ(animation.value * math.pi);
  Matrix4 antiClockWise(Animation animation) =>
      Matrix4.rotationZ(-animation.value * math.pi);
  @override
  Widget build(BuildContext context) {
    var firstTransformation;
    var secondTransformation;
    if (isClockWise) {
      firstTransformation = clockWise(animations[0]);
      secondTransformation = clockWise(animations[1]);
    } else {
      firstTransformation = antiClockWise(animations[0]);
      secondTransformation = antiClockWise(animations[1]);
    }
    return Transform(
      alignment: alignment,
      transform: firstTransformation,
      child: Transform(
        alignment: alignment,
        transform: secondTransformation,
        child: Brick(
          marginLeft: marginLeft,
        ),
      ),
    );
  }
}

class Brick extends StatelessWidget {
  final double marginLeft;
  Brick({this.marginLeft = 15.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      height: 10.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.green,
      ),
    );
  }
}
