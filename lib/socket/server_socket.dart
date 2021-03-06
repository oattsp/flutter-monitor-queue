import 'dart:io';

import 'package:flutter_monitor_queue/services/cashier_service.dart';
import 'package:flutter_monitor_queue/services/other_service.dart';

class ServerSocketTcp {
  // properties
  int port;
  ServerSocket serverSocket;
  Socket _socket;
  CashierServices cashierServices = CashierServices();
  OtherService otherService = OtherService();

  ServerSocketTcp(this.port);

  // method start server
  void start() async {
    if (serverSocket == null) {
      print('start server at port $port');
      serverSocket =
          await ServerSocket.bind(InternetAddress.anyIPv4, port, shared: true);
      serverSocket.listen(clientConnectHandle);
    }
  }

  // method stop server
  void stop() async {
    if (serverSocket != null) {
      serverSocket.close();
      serverSocket = null;
    }
    if (_socket != null) {
      _socket.close();
      _socket.destroy();
      _socket = null;
    }
  }

  // method receive client connect
  void clientConnectHandle(Socket socket) {
    _socket = socket;

    _socket.listen((onData) {
      var output = String.fromCharCodes(onData).trim();
      var row = output.split('\r\n');
      for (var i = 0; i < row.length; i++) {
        var tempCommand = row[i].split(new RegExp('\\s+'));
        if (tempCommand != null && tempCommand.length > 0) {
          print(tempCommand);
          if (tempCommand[0] == 'CHH') {
            cashierServices.onCallQueue(tempCommand);
            otherService.onCallQueue(tempCommand);
          }
          if (tempCommand[0] == 'RST' && tempCommand[1] == '1') {
            cashierServices.onResetQueue();
            otherService.onResetQueue();
            _socket.write('RST 100\r\n');
          }
        }
      }
    }, onError: (error) {
      print('onError: server error message = $error}');
      if (_socket != null) {
        _socket.close();
        _socket.destroy();
        _socket = null;
      }
    }, onDone: () {
      print('onDone: connection has terminated');
      if (_socket != null) {
        _socket.close();
        _socket.destroy();
        _socket = null;
      }
    });
  }
}
