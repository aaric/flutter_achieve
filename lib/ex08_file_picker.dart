import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/file_picker
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Text("hello file picker")
    );
  }
}
