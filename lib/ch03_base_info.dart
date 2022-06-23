import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DemoPage());
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DemoPageState();
  }
}

class _DemoPageState extends State<DemoPage> {
  var _osText = 'unknown';
  var _ipText = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('os: $_osText')
                  ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ip: $_ipText')
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _onPressed,
                        child: Text('check')
                    )
                  ]
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
