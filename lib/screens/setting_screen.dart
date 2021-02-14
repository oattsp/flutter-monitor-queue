import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController ctrlGroupCashier = TextEditingController();
  TextEditingController ctrlChannelCashier = TextEditingController();
  TextEditingController ctrlGroupOther = TextEditingController();
  TextEditingController ctrlChannelOther = TextEditingController();

  bool isLockGroupCashier = false;
  bool isLockChannelCashier = false;
  bool isLockGroupOther = false;
  bool isLockChannelOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "การตั้งค่า",
          style: TextStyle(fontFamily: Constants.SARABUN_REGULAR),
        ),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {}),
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
}
