import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/animation/text_blink.dart';
import 'package:flutter_monitor_queue/constants.dart';
import 'package:flutter_monitor_queue/socket/server_socket.dart';
import 'package:flutter_monitor_queue/widget/close_button.dart';
import 'package:flutter_monitor_queue/widget/normal_number.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ServerSocketTcp server = ServerSocketTcp(1024);

  @override
  void initState() {
    // TODO: implement initState
    server.start();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    server.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var defaultWidth = Constants.DEFAULT_WIDTH;
    var defaultHeight = Constants.DEFAULT_HEIGHT;

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    var deviceWidth = queryData.size.width;
    var deviceHeight = queryData.size.height;

    var ratioX = deviceWidth / defaultWidth;
    var ratioY = deviceHeight / defaultHeight;

    return WillPopScope(
      onWillPop: () async {
        server.stop();
        return true;
      },
      child: Scaffold(
          body: Stack(
        children: [
          closeButton(),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Constants.BACKGROUND_IMAGE),
                    fit: BoxFit.fill)),
          ),
          // รับชำระเงิน หมายเลขคิว
          TextBlink(
            text: "0000",
            width: 275 * ratioX,
            height: 150 * ratioY,
            top: 324 * ratioY,
            left: 180 * ratioX,
            isBlink: false,
          ),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 150 * ratioY,
              top: 460 * ratioY,
              left: 180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 150 * ratioY,
              top: 596 * ratioY,
              left: 180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 150 * ratioY,
              top: 733 * ratioY,
              left: 180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 150 * ratioY,
              top: 870 * ratioY,
              left: 180 * ratioX),

          // รับชำระเงิน ช่องบริการ
          TextBlink(
            text: "00",
            width: 138 * ratioX,
            height: 150 * ratioY,
            top: 324 * ratioY,
            left: 650 * ratioX,
            isBlink: false,
          ),
          NormalNumber(
              text: "00",
              width: 138 * ratioX,
              height: 150 * ratioY,
              top: 460 * ratioY,
              left: 650 * ratioX),
          NormalNumber(
              text: "00",
              width: 138 * ratioX,
              height: 150 * ratioY,
              top: 596 * ratioY,
              left: 650 * ratioX),
          NormalNumber(
              text: "00",
              width: 138 * ratioX,
              height: 150 * ratioY,
              top: 733 * ratioY,
              left: 650 * ratioX),
          NormalNumber(
              text: "00",
              width: 138 * ratioX,
              height: 150 * ratioY,
              top: 870 * ratioY,
              left: 650 * ratioX),

          // สาขา พระโขนง - สาขา สุขุมวิท หมายเลขคิว
          TextBlink(
            text: "0000",
            width: 275 * ratioX,
            height: 120 * ratioY,
            top: 240 * ratioY,
            left: 1180 * ratioX,
            isBlink: false,
          ),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 350 * ratioY,
              left: 1180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 461 * ratioY,
              left: 1180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 573 * ratioY,
              left: 1180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 685 * ratioY,
              left: 1180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 798 * ratioY,
              left: 1180 * ratioX),
          NormalNumber(
              text: "0000",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 910 * ratioY,
              left: 1180 * ratioX),

          // สาขา พระโขนง - สาขา สุขุมวิท ช่องบริการ
          TextBlink(
            text: "00",
            width: 275 * ratioX,
            height: 120 * ratioY,
            top: 240 * ratioY,
            left: 1505 * ratioX,
            isBlink: false,
          ),
          NormalNumber(
              text: "00",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 350 * ratioY,
              left: 1505 * ratioX),
          NormalNumber(
              text: "00",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 461 * ratioY,
              left: 1505 * ratioX),
          NormalNumber(
              text: "00",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 573 * ratioY,
              left: 1505 * ratioX),
          NormalNumber(
              text: "00",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 685 * ratioY,
              left: 1505 * ratioX),
          NormalNumber(
              text: "00",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 798 * ratioY,
              left: 1505 * ratioX),
          NormalNumber(
              text: "00",
              width: 275 * ratioX,
              height: 120 * ratioY,
              top: 910 * ratioY,
              left: 1505 * ratioX),
        ],
      )),
    );
  }
}
