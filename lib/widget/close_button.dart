import 'package:flutter/material.dart';

Widget closeButton() => Positioned(
      child: FlatButton(
        child: Text(''),
        onPressed: () {
          print('close button clieck');
        },
      ),
      top: 0,
      right: 0,
      width: 50,
      height: 50,
    );
