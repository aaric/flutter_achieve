import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        title: Text('ch14-Transform'),
      ),
      body: Column(
        children: <Widget>[
          // 水平倾斜
          /* Container(
            color: Colors.red,
            child: Transform(
              transform: Matrix4.skewX(0.5),
              child: Container(
                color: Colors.yellow,
                child: Text('skewX')
              ),
            ),
          ), */
          // 垂直倾斜
          /* Container(
            color: Colors.red,
            child: Transform(
              transform: Matrix4.skewY(0.5),
              child: Container(
                color: Colors.yellow,
                child: Text('skewY')
              ),
            ),
          ), */
          // 缩放
          /* Container(
            color: Colors.red,
            child: Transform.scale(
              scale: 2,
              child: Container(
                color: Colors.yellow,
                child: Text('scale')
              ),
            ),
          ), */
          // 旋转
          /* Container(
            color: Colors.red,
            child: Transform.rotate(
              angle: math.pi/2,
              child: Container(
                color: Colors.yellow,
                child: Text('rotate')
              ),
            )
          ), */
          // 平移
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Transform.translate(
              offset: Offset(100, 100),
              child: Container(
                color: Colors.yellow
              ),
            )
          ),
        ],
      )
    );
  }
}
