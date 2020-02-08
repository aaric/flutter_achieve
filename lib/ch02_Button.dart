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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ch02-Button'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('RaisedButton'),
              onPressed: () {
                print('RaisedButton clicked');
              },
            ),
            FlatButton(
              child: Text('FlatButton'),
              onPressed: () {
                print('FlatButton clicked');
              },
            ),
            OutlineButton(
              child: Text('OutlineButton'),
              onPressed: () {
                print('OutlineButton clicked');
              },
            ),
            FlatButton(
              child: Text('Custom FlatButton'),
              onPressed: () {
                print('Custom FlatButton clicked');
              },
              color: Colors.blue,
              textColor: Colors.red,
              highlightColor: Colors.yellow,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        )
    );
  }
}
