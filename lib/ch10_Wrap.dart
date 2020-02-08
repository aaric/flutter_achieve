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
          title: Text('ch10-Wrap'),
        ),
        body: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.end,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              color: Colors.red,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.yellow,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            )
          ],
        )
    );
  }
}
