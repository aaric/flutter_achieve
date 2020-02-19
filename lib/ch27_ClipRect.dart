import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
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
        title: Text('ch27-ClipRect'),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.network('http://www.005.tv/uploads/allimg/c160111/14525243LUc0-1H4196.png')
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 0.5,
                  sigmaY: 0.5
                ),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text('日向雏田',
                        style: Theme.of(context).textTheme.headline2
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

