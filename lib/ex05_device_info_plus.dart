import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var _myText = 'hello world';

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/device_info_plus
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text('$_myText')
        )
      );
  }
}
