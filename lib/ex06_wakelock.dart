import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  void initState() {
    // Wakelock.disable();
    Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          children: [
            Text('hello wakelock')
          ]
        )
      )
    );
  }
}
