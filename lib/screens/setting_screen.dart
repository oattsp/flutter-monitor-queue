import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/constants.dart';
import 'package:flutter_monitor_queue/getx/setting_state.dart';
import 'package:flutter_monitor_queue/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  bool first = false;

  SettingScreen({bool first}) {
    this.first = first;
  }

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final settingState = Get.put(SettingState());

  TextEditingController ctrlGroupCashier = TextEditingController();
  TextEditingController ctrlChannelCashier = TextEditingController();
  TextEditingController ctrlGroupOther = TextEditingController();
  TextEditingController ctrlChannelOther = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "การตั้งค่า",
          style: TextStyle(fontFamily: Constants.SARABUN_REGULAR),
        ),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () => setPrefs()),
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () => exit(0))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "ประเภทบริการรับชำระเงิน",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "การล็อคกลุ่ม",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR, fontSize: 16),
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Switch(
                            value: settingState.isLockGroupCashier,
                            onChanged: (value) {
                              settingState.updateIsLockGroupCashier(value);
                            })),
                    SizedBox(
                      width: 20,
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Expanded(
                                child: TextFormField(
                              validator: _validateGroupCashier,
                              enabled: settingState.isLockGroupCashier,
                              controller: ctrlGroupCashier,
                              decoration: InputDecoration(
                                  labelText: "กลุ่มบริการ",
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Constants.SARABUN_REGULAR)),
                            )))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "การล็อคช่อง",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR, fontSize: 16),
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Switch(
                            value: settingState.isLockChannelCashier,
                            onChanged: (value) {
                              settingState.updateIsLockChannelCashier(value);
                            })),
                    SizedBox(
                      width: 20,
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Expanded(
                                child: TextFormField(
                              validator: _validateChannelCashier,
                              enabled: settingState.isLockChannelCashier,
                              controller: ctrlChannelCashier,
                              decoration: InputDecoration(
                                  labelText: "ช่องบริการ",
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Constants.SARABUN_REGULAR)),
                            )))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "ประเภทบริการสาขาพระโขนง/สาขาสุขุมวิท",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "การล็อคกลุ่ม",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR, fontSize: 16),
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Switch(
                            value: settingState.isLockGroupOther,
                            onChanged: (value) {
                              settingState.updateIsLockGroupOther(value);
                            })),
                    SizedBox(
                      width: 20,
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Expanded(
                                child: TextFormField(
                              validator: _validateGroupOther,
                              enabled: settingState.isLockGroupOther,
                              controller: ctrlGroupOther,
                              decoration: InputDecoration(
                                  labelText: "กลุ่มบริการ",
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Constants.SARABUN_REGULAR)),
                            )))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "การล็อคช่อง",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR, fontSize: 16),
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Switch(
                            value: settingState.isLockChannelOther,
                            onChanged: (value) {
                              settingState.updateIsLockChannelOther(value);
                            })),
                    SizedBox(
                      width: 20,
                    ),
                    GetBuilder<SettingState>(
                        builder: (_) => Expanded(
                                child: TextFormField(
                              validator: _validateChannelOther,
                              enabled: settingState.isLockChannelOther,
                              controller: ctrlChannelOther,
                              decoration: InputDecoration(
                                  labelText: "ช่องบริการ",
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Constants.SARABUN_REGULAR)),
                            )))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _validateGroupCashier(String value) {
    if (settingState.isLockGroupCashier) {
      if (value == "") {
        return "กรุณาระบุกลุ่มบริการ";
      }
      return null;
    }
    return null;
  }

  String _validateGroupOther(String value) {
    if (settingState.isLockGroupOther) {
      if (value == "") {
        return "กรุณาระบุกลุ่มบริการ";
      }
      return null;
    }
    return null;
  }

  String _validateChannelCashier(String value) {
    if (settingState.isLockChannelCashier) {
      if (value == "") {
        return "กรุณาระบุช่องบริการ";
      }
      return null;
    }
    return null;
  }

  String _validateChannelOther(String value) {
    if (settingState.isLockChannelOther) {
      if (value == "") {
        return "กรุณาระบุช่องบริการ";
      }
      return null;
    }
    return null;
  }

  void setPrefs() async {
    if (_formKey.currentState.validate()) {
      try {
        final SharedPreferences prefs = await _prefs;
        // set status locked
        prefs.setBool(Constants.KEY_IS_LOCK_GROUP_CASHIER,
            settingState.isLockGroupCashier);
        prefs.setBool(Constants.KEY_IS_LOCK_CHANNEL_CASHIER,
            settingState.isLockChannelCashier);
        prefs.setBool(
            Constants.KEY_IS_LOCK_GROUP_OTHER, settingState.isLockGroupOther);
        prefs.setBool(Constants.KEY_IS_LOCK_CHANNEL_OTHER,
            settingState.isLockChannelOther);

        // set value locked
        prefs.setString(
            Constants.KEY_GROUP_LOCK_CASHIER, ctrlGroupCashier.text);
        prefs.setString(
            Constants.KEY_CHANNEL_LOCK_CASHIER, ctrlChannelCashier.text);
        prefs.setString(Constants.KEY_GROUP_LOCK_OTHER, ctrlGroupOther.text);
        prefs.setString(
            Constants.KEY_CHANNEL_LOCK_OTHER, ctrlChannelOther.text);

        settingState.updateGroupCashier(ctrlGroupCashier.text);
        settingState.updateChannelCashier(ctrlChannelCashier.text);
        settingState.updateGroupOther(ctrlGroupOther.text);
        settingState.updateChannelOther(ctrlChannelOther.text);

        print("บันทึกข้อมูลสำเร็จ");

        Get.to(() => HomeScreen());
      } catch (err) {
        print(err.toString());
      }
    } else {
      print("บันทึกข้อมูลล้มเหลว");
    }
  }

  void getPrefs() async {
    final SharedPreferences prefs = await _prefs;
    var _isLockGroupCashier =
        prefs.getBool(Constants.KEY_IS_LOCK_GROUP_CASHIER);
    var _isLockChannelCashier =
        prefs.getBool(Constants.KEY_IS_LOCK_CHANNEL_CASHIER);
    var _isLockGroupOther = prefs.getBool(Constants.KEY_IS_LOCK_GROUP_OTHER);
    var _isLockChannelOther =
        prefs.getBool(Constants.KEY_IS_LOCK_CHANNEL_OTHER);
    var _lockGroupCashier = prefs.getString(Constants.KEY_GROUP_LOCK_CASHIER);
    var _lockChannelCashier =
        prefs.getString(Constants.KEY_CHANNEL_LOCK_CASHIER);
    var _lockGroupOther = prefs.getString(Constants.KEY_GROUP_LOCK_OTHER);
    var _lockChannelOther = prefs.getString(Constants.KEY_CHANNEL_LOCK_OTHER);

    if (_isLockGroupCashier == null ||
        _isLockChannelCashier == null ||
        _isLockGroupOther == null ||
        _isLockChannelOther == null ||
        _lockGroupCashier == null ||
        _lockChannelCashier == null ||
        _lockGroupOther == null ||
        _lockChannelOther == null) {
      print("เปิดแอพครั้งแรก");
      return;
    }

    ctrlGroupCashier.text = _lockGroupCashier;
    ctrlChannelCashier.text = _lockChannelCashier;
    ctrlGroupOther.text = _lockGroupOther;
    ctrlChannelOther.text = _lockChannelOther;

    settingState.updateIsLockGroupCashier(_isLockGroupCashier);
    settingState.updateIsLockChannelCashier(_isLockChannelCashier);
    settingState.updateIsLockGroupOther(_isLockGroupOther);
    settingState.updateIsLockChannelOther(_isLockChannelOther);

    if (widget.first) {
      settingState.updateGroupCashier(_lockGroupCashier);
      settingState.updateChannelCashier(_lockChannelCashier);
      settingState.updateGroupOther(_lockGroupOther);
      settingState.updateChannelOther(_lockChannelOther);

      Get.to(() => HomeScreen());
    }
  }
}
