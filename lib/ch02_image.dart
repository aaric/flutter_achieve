import 'package:flutter/material.dart';

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
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              // flex: 1,
              child: Image.asset('assets/images/banzhuan.jpg')
            ),
            Expanded(
              // flex: 2,
              child: Image.network('http://10.0.11.25:8021/test/banzhuan.jpg')
            )
          ],
        )
    );
  }
}
