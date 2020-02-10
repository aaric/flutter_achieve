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
          title: Text('ch11-Padding'),
        ),
        body: Container(
          width: 400,
          height: 400,
          color: Colors.red,
          child: Padding(
            //padding: EdgeInsets.all(10),
            //padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
            padding: EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.blue,
            ),
          ),
        )
    );
  }
}
