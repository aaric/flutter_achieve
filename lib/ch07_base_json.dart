import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_applet/pojo/Student.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String _jsonText = '{"name":"zhangsan","age":18}';
  bool _btnFlag = false;

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
                onPressed: _btnFlag ? null : _toObject, child: const Text('to_object')
            ),
            ElevatedButton(
                onPressed: _btnFlag ? _toJson : null, child: const Text('to_json')
            )
          ]
        )
      )
    );
  }

  void _updateJsonText(String text, bool flag) {
    setState(() {
      _jsonText = text;
      _btnFlag = !_btnFlag;
    });
  }

  void _toObject() {
    // Map<String, dynamic> map = jsonDecode(_jsonText);
    // var name = map["name"] as String;
    // var age = map["age"] as int;
    // _updateJsonText('Name: ${name}, Age: ${age}');

    // https://javiercbk.github.io/json_to_dart/
    Student student = Student.fromJson(jsonDecode(_jsonText));
    _updateJsonText('Name: ${student.name}, Age: ${student.age}', _btnFlag);
  }

  void _toJson() {
    // Map<String, dynamic> map = {
    //   "name": "lisi",
    //   "age": 20
    // };
    // _updateJsonText(jsonEncode(map));

    Student student = Student(name: 'lisi', age: 20);
    _updateJsonText(jsonEncode(student.toJson()), _btnFlag);
  }
}
