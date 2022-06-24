import 'package:flutter/material.dart';
import 'package:flutter_applet/ex04_mqtt_client.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoDemoPage();
}

class _DemoDemoPage extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              // flex: 1,
                child: Image.asset('assets/images/banzhuan.jpg')
            ),
            Expanded(
              // flex: 2,
                child: Image.network('http://10.0.11.25:8021/test/banzhuan.jpg')
            )
          ],
        )
    );
  }
}
