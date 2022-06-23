import 'package:flutter/material.dart';
import 'dart:io';

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
  var _myText = 'hello world';

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
                    Text('$_myText')
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _onPressed,
                        child: Text('check os')
                    )
                  ]
                )
              ]
          )
        )
    );
  }

  void _onPressed() {
    var myText = 'unknown';
    if (Platform.isAndroid) {
      myText = 'android';
    } else if (Platform.isWindows) {
      myText = 'windows';
    }
    setState(() {
      _myText = myText;
    });
  }
}
