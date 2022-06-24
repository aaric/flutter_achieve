import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applet/ex04_mqtt_client.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(color: CSSColors.orange)
    );
  }
}
