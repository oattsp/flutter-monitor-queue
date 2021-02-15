import 'package:flutter/material.dart';
import 'package:flutter_monitor_queue/animation/text_blink.dart';
import 'package:flutter_monitor_queue/constants.dart';
import 'package:flutter_monitor_queue/getx/cashier_state.dart';
import 'package:flutter_monitor_queue/getx/other_state.dart';
import 'package:flutter_monitor_queue/socket/server_socket.dart';
import 'package:flutter_monitor_queue/widget/close_button.dart';
import 'package:flutter_monitor_queue/widget/normal_number.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cashierState = Get.put(CashierState());
  final otherState = Get.put(OtherState());
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
          GetBuilder<CashierState>(
              builder: (_) => TextBlink(
                    text: cashierState.queue.length >= 1
                        ? cashierState.queue[0].queue
                        : "0000",
                    width: 275 * ratioX,
                    height: 150 * ratioY,
                    top: 324 * ratioY,
                    left: 180 * ratioX,
                    isBlink: cashierState.isBlink,
                  )),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 2
                      ? cashierState.queue[1].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 150 * ratioY,
                  top: 460 * ratioY,
                  left: 180 * ratioX)),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 3
                      ? cashierState.queue[2].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 150 * ratioY,
                  top: 596 * ratioY,
                  left: 180 * ratioX)),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 4
                      ? cashierState.queue[3].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 150 * ratioY,
                  top: 733 * ratioY,
                  left: 180 * ratioX)),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 5
                      ? cashierState.queue[4].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 150 * ratioY,
                  top: 870 * ratioY,
                  left: 180 * ratioX)),

          // รับชำระเงิน ช่องบริการ
          GetBuilder<CashierState>(
              builder: (_) => TextBlink(
                    text: cashierState.queue.length >= 1
                        ? cashierState.queue[0].channel
                        : "0",
                    width: 138 * ratioX,
                    height: 135 * ratioY,
                    top: 330 * ratioY,
                    left: 650 * ratioX,
                    isBlink: cashierState.isBlink,
                  )),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 2
                      ? cashierState.queue[1].channel
                      : "0",
                  width: 138 * ratioX,
                  height: 135 * ratioY,
                  top: 467 * ratioY,
                  left: 650 * ratioX)),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 3
                      ? cashierState.queue[2].channel
                      : "0",
                  width: 138 * ratioX,
                  height: 135 * ratioY,
                  top: 605 * ratioY,
                  left: 650 * ratioX)),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 4
                      ? cashierState.queue[3].channel
                      : "0",
                  width: 138 * ratioX,
                  height: 135 * ratioY,
                  top: 743 * ratioY,
                  left: 650 * ratioX)),
          GetBuilder<CashierState>(
              builder: (_) => NormalNumber(
                  text: cashierState.queue.length >= 5
                      ? cashierState.queue[4].channel
                      : "0",
                  width: 138 * ratioX,
                  height: 135 * ratioY,
                  top: 878 * ratioY,
                  left: 650 * ratioX)),

          // สาขา พระโขนง - สาขา สุขุมวิท หมายเลขคิว
          GetBuilder<OtherState>(
              builder: (_) => TextBlink(
                    text: otherState.queue.length >= 1
                        ? otherState.queue[0].queue
                        : "0000",
                    width: 275 * ratioX,
                    height: 120 * ratioY,
                    top: 240 * ratioY,
                    left: 1180 * ratioX,
                    isBlink: otherState.isBlink,
                  )),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 2
                      ? otherState.queue[1].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 350 * ratioY,
                  left: 1180 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 3
                      ? otherState.queue[2].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 461 * ratioY,
                  left: 1180 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 4
                      ? otherState.queue[3].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 573 * ratioY,
                  left: 1180 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 5
                      ? otherState.queue[4].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 685 * ratioY,
                  left: 1180 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 6
                      ? otherState.queue[5].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 798 * ratioY,
                  left: 1180 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 7
                      ? otherState.queue[6].queue
                      : "0000",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 910 * ratioY,
                  left: 1180 * ratioX)),

          // สาขา พระโขนง - สาขา สุขุมวิท ช่องบริการ
          GetBuilder<OtherState>(
              builder: (_) => TextBlink(
                    text: otherState.queue.length >= 1
                        ? otherState.queue[0].channel
                        : "0",
                    width: 275 * ratioX,
                    height: 120 * ratioY,
                    top: 240 * ratioY,
                    left: 1510 * ratioX,
                    isBlink: otherState.isBlink,
                  )),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 2
                      ? otherState.queue[1].channel
                      : "0",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 350 * ratioY,
                  left: 1510 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 3
                      ? otherState.queue[2].channel
                      : "0",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 461 * ratioY,
                  left: 1510 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 4
                      ? otherState.queue[3].channel
                      : "0",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 573 * ratioY,
                  left: 1510 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 5
                      ? otherState.queue[4].channel
                      : "0",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 685 * ratioY,
                  left: 1510 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 6
                      ? otherState.queue[5].channel
                      : "0",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 798 * ratioY,
                  left: 1510 * ratioX)),
          GetBuilder<OtherState>(
              builder: (_) => NormalNumber(
                  text: otherState.queue.length >= 7
                      ? otherState.queue[6].channel
                      : "0",
                  width: 275 * ratioX,
                  height: 120 * ratioY,
                  top: 910 * ratioY,
                  left: 1510 * ratioX)),
        ],
      )),
    );
  }
}
