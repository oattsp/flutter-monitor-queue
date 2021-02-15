import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController ctrlGroupCashier = TextEditingController();
  TextEditingController ctrlChannelCashier = TextEditingController();
  TextEditingController ctrlGroupOther = TextEditingController();
  TextEditingController ctrlChannelOther = TextEditingController();

  bool isLockGroupCashier = false;
  bool isLockChannelCashier = false;
  bool isLockGroupOther = false;
  bool isLockChannelOther = false;

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
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {})
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
                    Switch(
                        value: isLockGroupCashier,
                        onChanged: (value) {
                          setState(() {
                            isLockGroupCashier = value;
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      validator: _validateGroupCashier,
                      enabled: isLockGroupCashier,
                      controller: ctrlGroupCashier,
                      decoration: InputDecoration(
                          labelText: "กลุ่มบริการ",
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: Constants.SARABUN_REGULAR)),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "การล็อคช่อง",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR, fontSize: 16),
                    ),
                    Switch(
                        value: isLockChannelCashier,
                        onChanged: (value) {
                          setState(() {
                            isLockChannelCashier = value;
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      validator: _validateChannelCashier,
                      enabled: isLockChannelCashier,
                      controller: ctrlChannelCashier,
                      decoration: InputDecoration(
                          labelText: "ช่องบริการ",
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: Constants.SARABUN_REGULAR)),
                    ))
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
                    Switch(
                        value: isLockGroupOther,
                        onChanged: (value) {
                          setState(() {
                            isLockGroupOther = value;
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      validator: _validateGroupOther,
                      enabled: isLockGroupOther,
                      controller: ctrlGroupOther,
                      decoration: InputDecoration(
                          labelText: "กลุ่มบริการ",
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: Constants.SARABUN_REGULAR)),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "การล็อคช่อง",
                      style: TextStyle(
                          fontFamily: Constants.SARABUN_REGULAR, fontSize: 16),
                    ),
                    Switch(
                        value: isLockChannelOther,
                        onChanged: (value) {
                          setState(() {
                            isLockChannelOther = value;
                          });
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      validator: _validateChannelOther,
                      enabled: isLockChannelOther,
                      controller: ctrlChannelOther,
                      decoration: InputDecoration(
                          labelText: "ช่องบริการ",
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: Constants.SARABUN_REGULAR)),
                    ))
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
    if (isLockGroupCashier) {
      if (value == "") {
        return "กรุณาระบุกลุ่มบริการ";
      }
      return null;
    }
    return null;
  }

  String _validateGroupOther(String value) {
    if (isLockGroupOther) {
      if (value == "") {
        return "กรุณาระบุกลุ่มบริการ";
      }
      return null;
    }
    return null;
  }

  String _validateChannelCashier(String value) {
    if (isLockChannelCashier) {
      if (value == "") {
        return "กรุณาระบุช่องบริการ";
      }
      return null;
    }
    return null;
  }

  String _validateChannelOther(String value) {
    if (isLockChannelOther) {
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
        prefs.setBool(Constants.KEY_IS_LOCK_GROUP_CASHIER, isLockGroupCashier);
        prefs.setBool(
            Constants.KEY_IS_LOCK_CHANNEL_CASHIER, isLockChannelCashier);
        prefs.setBool(Constants.KEY_IS_LOCK_GROUP_OTHER, isLockGroupOther);
        prefs.setBool(Constants.KEY_IS_LOCK_CHANNEL_OTHER, isLockChannelOther);
        // set value locked
        prefs.setString(
            Constants.KEY_GROUP_LOCK_CASHIER, ctrlGroupCashier.text);
        prefs.setString(
            Constants.KEY_CHANNEL_LOCK_CASHIER, ctrlChannelCashier.text);
        prefs.setString(Constants.KEY_GROUP_LOCK_OTHER, ctrlGroupOther.text);
        prefs.setString(
            Constants.KEY_CHANNEL_LOCK_OTHER, ctrlChannelOther.text);

        print("บันทึกข้อมูลสำเร็จ");
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
    var _lockChannelOther =
        prefs.getString(Constants.KEY_CHANNEL_LOCK_OTHER);

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

    setState(() {
      isLockGroupCashier = _isLockGroupCashier;
      isLockChannelCashier = _isLockChannelCashier;
      isLockGroupOther = _isLockGroupOther;
      isLockChannelOther = _isLockChannelOther;
    });

    ctrlGroupCashier.text = _lockGroupCashier;
    ctrlChannelCashier.text = _lockChannelCashier;
    ctrlGroupOther.text = _lockGroupOther;
    ctrlChannelOther.text = _lockChannelOther;
  }
}
