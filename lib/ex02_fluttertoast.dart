import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          onPressed: () {
            // launchUrl(toUri('https://flutter.dev'));
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                // toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                // timeInSecForIosWeb: 1,
                // backgroundColor: Colors.blue,
                // textColor: Colors.white,
                fontSize: 16.0
            );
          },
          child: const Text('Show Website')
        )
      )
    );
  }
}
