import 'dart:async';
import 'package:flutter_monitor_queue/getx/other_state.dart';
import 'package:flutter_monitor_queue/getx/setting_state.dart';
import 'package:flutter_monitor_queue/models/queue_model.dart';
import 'package:get/get.dart';

class OtherService {
  final SettingState settingState = Get.find();
  final OtherState otherState = Get.find();
  Timer _timer;

  void onCallQueue(List<String> tempCommand) {
    List<String> groupOther = settingState.groupOther.split(",");
    List<String> channelOther = settingState.channelOther.split(",");
    String group = "${int.parse(tempCommand[5])}";
    String channel = "${int.parse(tempCommand[1])}";
    String queue = tempCommand[2].trim();
    String blink = tempCommand[4].trim();

    // ล็อคกลุ่มบริการ และล็อคช่องบริการ
    if (settingState.isLockGroupOther && settingState.isLockChannelOther) {
      if (groupOther.contains(group) && channelOther.contains(channel)) {
        otherState.updateQueue(QueueModel(queue: queue, channel: channel));
        if (blink == "1") {
          otherState.updateBlink(true);
          if (_timer != null) {
            _timer.cancel();
          }
          _timer = Timer(const Duration(seconds: 15), () {
            otherState.updateBlink(false);
          });
        }
      }
    }
    // ล็อคกลุ่มบริการ แต่ไม่ล็อคช่องบริการ
    if (settingState.isLockGroupOther && !settingState.isLockChannelOther) {
      if (groupOther.contains(group)) {
        otherState.updateQueue(QueueModel(queue: queue, channel: channel));
        if (blink == "1") {
          otherState.updateBlink(true);
          if (_timer != null) {
            _timer.cancel();
          }
          _timer = Timer(const Duration(seconds: 15), () {
            otherState.updateBlink(false);
          });
        }
      }
    }
    // ไม่ล็อคกลุ่มบริการ แต่ล็อคช่องบริการ
    if (!settingState.isLockGroupOther && settingState.isLockChannelOther) {
      if (channelOther.contains(channel)) {
        otherState.updateQueue(QueueModel(queue: queue, channel: channel));
        if (blink == "1") {
          otherState.updateBlink(true);
          if (_timer != null) {
            _timer.cancel();
          }
          _timer = Timer(const Duration(seconds: 15), () {
            otherState.updateBlink(false);
          });
        }
      }
    }
    // ไม่ล็อคกลุ่มบริการ และไม่ล็อคช่องบริการ
    if (!settingState.isLockGroupOther && !settingState.isLockChannelOther) {
      otherState.updateQueue(QueueModel(queue: queue, channel: channel));
      if (blink == "1") {
        otherState.updateBlink(true);
        if (_timer != null) {
          _timer.cancel();
        }
        _timer = Timer(const Duration(seconds: 15), () {
          otherState.updateBlink(false);
        });
      }
    }
  }

  void onResetQueue() {
    otherState.resetQueue();
  }
}
