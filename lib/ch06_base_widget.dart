import 'package:flutter/material.dart';

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
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('hello world', textAlign: TextAlign.right),
            Text('hello world, hello world, hello world, hello world, hello world, hello world', maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('hello world', textScaleFactor: 2.0),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: 'Flutter: '),
                TextSpan(text: 'https://flutter.dev', style: TextStyle(color: Colors.blue))
              ]
            ))
          ]
        )
      )
    );
  }

}
