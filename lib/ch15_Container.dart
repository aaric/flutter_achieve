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
        title: Text('ch15-Container'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 100,
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Text('c1'),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: 300,
            height: 100,
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Text('c2'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            width: 300,
            height: 100,
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Text('c3'),
          )
        ],
      )
    );
  }
}
