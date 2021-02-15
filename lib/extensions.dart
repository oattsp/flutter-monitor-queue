import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

void rotateScreen() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}

void keepScreenOn() {
  Wakelock.enable();
}

void keepScreenOff() {
  Wakelock.disable();
}