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
          title: Text('ch20-Listener'),
        ),
        body: Listener(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          onPointerDown: (e) {
            print('down');
          },
          onPointerUp: (e) {
            print('up');
          },
          onPointerMove: (e) {
            print('move');
          },
          onPointerCancel: (e) {
            print('cancel');
          },
        )
    );
  }
}
