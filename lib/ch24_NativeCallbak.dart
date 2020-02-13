import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const CHANNEL_NAME = 'com.sample.flutter/call_native';
  static const platform = MethodChannel(CHANNEL_NAME);

  var _batteryLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ch24-NativeCallbak'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('getBatteryLevel'),
            onPressed: () async {
              int result = await platform.invokeMethod('getBatteryLevel');
              setState(() {
                _batteryLevel = result;
              });
            },
          ),
          Text('Battery Level: $_batteryLevel')
        ],
      )
    );
  }
}
