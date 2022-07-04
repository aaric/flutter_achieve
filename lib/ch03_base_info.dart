import 'dart:io';

import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var _osText = 'unknown';
  var _ipText = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title)
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('os: $_osText'),
                Text('ip: $_ipText'),
                ElevatedButton(
                    onPressed: _onPressed,
                    child: const Text('check')
                )
              ]
          )
        )
    );
  }

  void _onPressed() async {
    var osText = 'unknown';
    if (Platform.isAndroid) {
      osText = 'android';
    } else if (Platform.isWindows) {
      osText = 'windows';
    }

    var ipV4Text = '';
    var ipV6Text = '';
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        switch (addr.type) {
          case InternetAddressType.IPv4:
            ipV4Text = addr.address;
            break;
          case InternetAddressType.IPv6:
            ipV6Text = addr.address;
            break;
        }
      }
    }

    setState(() {
      _osText = osText;
      _ipText = '$ipV4Text | $ipV6Text';
    });
  }
}
