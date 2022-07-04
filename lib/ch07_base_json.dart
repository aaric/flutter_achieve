import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;
  
  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String _helloText = 'hello world';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_helloText'),
          ElevatedButton(
              onPressed: _toJson, child: const Text('to_json')
          ),
          ElevatedButton(
              onPressed: _toObject, child: const Text('to_json')
          )
        ]
      )
    );
  }

  void _toJson() {

  }

  void _toObject() {

  }
}
