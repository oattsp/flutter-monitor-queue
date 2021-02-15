import 'package:get/get.dart';

class SettingState extends GetxController {
    bool isLockGroupCashier = false;
    bool isLockChannelCashier = false;
    bool isLockGroupOther = false;
    bool isLockChannelOther = false;
    String groupCashier = "";
    String channelCashier = "";
    String groupOther = "";
    String channelOther = "";

    void updateIsLockGroupCashier(bool value) {
        isLockGroupCashier = value;
        update();
    }

    void updateIsLockChannelCashier(bool value) {
        isLockChannelCashier = value;
        update();
    }

    void updateIsLockGroupOther(bool value) {
        isLockGroupOther = value;
        update();
    }

    void updateIsLockChannelOther(bool value) {
        isLockChannelOther = value;
        update();
    }

    void updateGroupCashier(String value) {
        groupCashier = value;
        update();
    }

    void updateChannelCashier(String value) {
        channelCashier = value;
        update();
    }

    void updateGroupOther(String value) {
        groupOther = value;
        update();
    }

    void updateChannelOther(String value) {
        channelOther = value;
        update();
    }
}