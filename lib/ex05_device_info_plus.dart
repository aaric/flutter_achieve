import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'dart:io';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var _osName = 'unknown';
  var _osMode = 'unknown';
  var _osVersion = 'unknown';

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/device_info_plus
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_osName'),
              Text('$_osMode'),
              Text('$_osVersion')
            ]
          )
        )
      );
  }

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  void initStateAsync() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _osName = androidInfo.display!;
      _osMode = androidInfo.model!;
      _osVersion = androidInfo.version.release!;
    } else if(Platform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      _osName = windowsInfo.computerName;
    }
  }
}
