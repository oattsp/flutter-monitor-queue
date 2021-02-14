import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/constants.dart';

class TextBlink extends StatefulWidget {
  String text;
  double width;
  double height;
  double top;
  double left;
  bool isBlink;

  TextBlink(
      {String text,
      double width,
      double height,
      double top,
      double left,
      bool isBlink}) {
    this.text = text;
    this.width = width;
    this.height = height;
    this.top = top;
    this.left = left;
    this.isBlink = isBlink;
  }

  @override
  _TextBlinkState createState() => _TextBlinkState();
}

class _TextBlinkState extends State<TextBlink>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;

  void initAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.transparent, end: Colors.red).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    if (widget.isBlink) {
        controller.forward();
    } else {
        controller.stop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Positioned(
        child: Container(
          width: widget.width,
          height: widget.height,
          child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return new Container(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      widget.text,
                      style: TextStyle(
                          color:
                              widget.isBlink ? animation.value : Colors.black,
                          fontFamily: Constants.ROBOTO_REGULAR),
                    ),
                  ),
                );
              }),
          color: Colors.transparent,
        ),
        top: widget.top,
        left: widget.left,
      );
}
