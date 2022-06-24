import 'package:flutter/material.dart';
import 'package:css_colors/css_colors.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/css_colors
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(color: CSSColors.orange)
    );
  }
}
