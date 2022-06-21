import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DemoPage());
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
