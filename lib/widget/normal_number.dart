import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/constants.dart';

Widget NormalNumber(
        {String text, double width, double height, double top, double left}) =>
    Positioned(
      child: Container(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontFamily: Constants.ROBOTO_REGULAR),
          ),
        ),
        color: Colors.transparent,
      ),
      top: top,
      left: left,
    );
