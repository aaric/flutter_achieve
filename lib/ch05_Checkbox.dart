import 'package:flutter/material.dart';

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
  var _switchVal = false;
  var _checkboxVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ch05-Checkbox'),
        ),
        body: Column(
          children: <Widget>[
            Switch(
              value: _switchVal,
              onChanged: (val) {
                setState(() {
                  this._switchVal = val;
                });
              },
            ),
            Checkbox(
              value: _checkboxVal,
              onChanged: (val) {
                setState(() {
                  this._checkboxVal = val;
                });
              },
            )
          ],
        )
    );
  }
}
