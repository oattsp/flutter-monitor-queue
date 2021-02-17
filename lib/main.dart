import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/extensions.dart';
import 'package:flutter_monitor_queue/screens/setting_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  rotateScreen();
  keepScreenOn();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Queue TV",
      home: SettingScreen(first: true,),
    );
  }
}
