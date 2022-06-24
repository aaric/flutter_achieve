import 'package:flutter/material.dart';
import 'package:flutter_applet/ex04_mqtt_client.dart';
import 'package:url_launcher/url_launcher.dart';

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
        body: Center(
            child: ElevatedButton(
                onPressed: _launchUrl,
                child: const Text('Open pub.dev for china')
            )
        )
    );
  }

  void _launchUrl() async {
    final Uri _url = Uri.parse('https://pub.flutter-io.cn');
    if (!await launchUrl(_url)) {
      throw 'launch $_url exception';
    }
  }
}
