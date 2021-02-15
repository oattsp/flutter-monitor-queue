import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/extensions.dart';
import 'package:flutter_monitor_queue/screens/home_screen.dart';
import 'package:flutter_monitor_queue/screens/setting_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  rotateScreen();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Queue TV",
      home: SettingScreen(),
    );
  }
}
