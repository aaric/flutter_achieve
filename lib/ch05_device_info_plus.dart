import 'package:flutter/material.dart';

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
        child: Text('$_myText')
      )
    );
  }
}
