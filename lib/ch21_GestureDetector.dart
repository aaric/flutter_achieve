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
          title: Text('ch21-GestureDetector'),
        ),
        body: GestureDetector(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
          ),
          onTap: () {
            print('tap');
          },
          onDoubleTap: () {
            print('double tap');
          },
          onLongPress: () {
            print('long press');
          },
          onHorizontalDragStart: (e) {
            print('horizontal drag');
          },
          onVerticalDragStart: (e) {
            print('vertical drag');
          },
          /*onScaleUpdate: (e) {
            print('scale');
          },*/
        )
    );
  }
}
