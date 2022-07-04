import 'package:flutter/material.dart';

import 'dart:convert';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String _jsonText = '{"name":"zhangsan","age":18}';

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
            Text('$_jsonText'),
            ElevatedButton(
                onPressed: _toObject, child: const Text('to_object')
            ),
            ElevatedButton(
                onPressed: _toJson, child: const Text('to_json')
            )
          ]
        )
      )
    );
  }

  void _updateJsonText(String text) {
    setState(() {
      _jsonText = text;
    });
  }

  void _toObject() {
    Map<String, dynamic> map = jsonDecode(_jsonText);
    _updateJsonText('Name: ${map["name"]}, Age: ${map["age"]}');
  }

  void _toJson() {
    Map<String, dynamic> map = {
      "name": "lisi",
      "age": 20
    };
    _updateJsonText(jsonEncode(map));
  }
}
