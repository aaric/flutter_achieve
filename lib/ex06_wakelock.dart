import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var _wakelockState = true;

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The wakelock is currently ${_wakelockState? "enable": "disable"}'),
            ElevatedButton(onPressed: _toggleWakelock, child: Text('${!_wakelockState? "enable": "disable"}'))
          ]
        )
      )
    );
  }

  void _toggleWakelock() {
    setState((){
      _wakelockState = !_wakelockState;
    });
    // if (_wakelockState) {
    //   Wakelock.enable();
    // } else {
    //   Wakelock.disable();
    // }
    Wakelock.toggle(enable: _wakelockState);
  }
}
