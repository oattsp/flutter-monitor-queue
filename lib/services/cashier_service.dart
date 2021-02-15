import 'package:flutter_monitor_queue/getx/setting_state.dart';
import 'package:flutter_monitor_queue/models/queue_model.dart';
import 'package:get/get.dart';

class CashierServices {
    final SettingState settingState = Get.find();

    void onCallQueue(List<String> tempCommand) {
        List<String> groupCashier = settingState.groupCashier.split(",");
        List<String> channelCashier = settingState.channelCashier.split(",");
        String group = "${int.parse(tempCommand[5])}";
        String channel = "${int.parse(tempCommand[1])}";
        // ล็อคกลุ่มบริการ และล็อคช่องบริการ
        if (settingState.isLockGroupCashier && settingState.isLockChannelCashier) {
            // print(groupCashier);
            // print(groupCashier.contains("1"));
            print(QueueModel(queue: "A001", channel: "1") == QueueModel(queue: "A001", channel: "1"));
            print("Group : $group");
            print("Channel : $channel");
            if (groupCashier.contains(group) && channelCashier.contains(channel)) {

            }
        }
    }
}