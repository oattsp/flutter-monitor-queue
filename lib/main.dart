import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/screens/home_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queue TV',
      home: HomeScreen(),
    );
  }
}
