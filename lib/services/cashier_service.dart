import 'dart:async';
import 'package:flutter_monitor_queue/getx/cashier_state.dart';
import 'package:flutter_monitor_queue/getx/setting_state.dart';
import 'package:flutter_monitor_queue/models/queue_model.dart';
import 'package:get/get.dart';

class CashierServices {
  final SettingState settingState = Get.find();
  final CashierState cashierState = Get.find();
  Timer _timer;

  void onCallQueue(List<String> tempCommand) {
    List<String> groupCashier = settingState.groupCashier.split(",");
    List<String> channelCashier = settingState.channelCashier.split(",");
    String group = "${int.parse(tempCommand[5])}";
    String channel = "${int.parse(tempCommand[1])}";
    String queue = tempCommand[2].trim();
    String blink = tempCommand[4].trim();
    // ล็อคกลุ่มบริการ และล็อคช่องบริการ
    if (settingState.isLockGroupCashier && settingState.isLockChannelCashier) {
      if (groupCashier.contains(group) && channelCashier.contains(channel)) {
        cashierState.updateQueue(QueueModel(queue: queue, channel: channel));
        if (blink == "1") {
          cashierState.updateBlink(true);
          if (_timer != null) {
            _timer.cancel();
          }
          _timer = Timer(const Duration(seconds: 15), () {
            cashierState.updateBlink(false);
          });
        }
      }
    }
    // ล็อคกลุ่มบริการ แต่ไม่ล็อคช่องบริการ
    if (settingState.isLockGroupCashier && !settingState.isLockChannelCashier) {
      if (groupCashier.contains(group)) {
        cashierState.updateQueue(QueueModel(queue: queue, channel: channel));
        if (blink == "1") {
          cashierState.updateBlink(true);
          if (_timer != null) {
            _timer.cancel();
          }
          _timer = Timer(const Duration(seconds: 15), () {
            cashierState.updateBlink(false);
          });
        }
      }
    }
    // ไม่ล็อคกลุ่มบริการ แต่ล็อคช่องบริการ
    if (!settingState.isLockGroupCashier && settingState.isLockChannelCashier) {
      if (channelCashier.contains(channel)) {
        cashierState.updateQueue(QueueModel(queue: queue, channel: channel));
        if (blink == "1") {
          cashierState.updateBlink(true);
          if (_timer != null) {
            _timer.cancel();
          }
          _timer = Timer(const Duration(seconds: 15), () {
            cashierState.updateBlink(false);
          });
        }
      }
    }
    // ไม่ล็อคกลุ่มบริการ และไม่ล็อคช่องบริการ
    if (!settingState.isLockGroupCashier &&
        !settingState.isLockChannelCashier) {
      cashierState.updateQueue(QueueModel(queue: queue, channel: channel));
      if (blink == "1") {
        cashierState.updateBlink(true);
        if (_timer != null) {
          _timer.cancel();
        }
        _timer = Timer(const Duration(seconds: 15), () {
          cashierState.updateBlink(false);
        });
      }
    }
  }
}
