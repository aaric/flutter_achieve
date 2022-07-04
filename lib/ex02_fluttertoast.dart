import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/fluttertoast
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title)
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
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
                child: const Text('Show Toast')
            )
        )
    );
  }
}
