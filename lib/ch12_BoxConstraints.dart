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
        title: Text('ch12-BoxConstraints'),
      ),
      /* body: SizedBox(
        width: 200,
        height: 200,
        child: Container(
          color: Colors.red,
        ),
      ), */
      body: ConstrainedBox(
        constraints: BoxConstraints(
          //minHeight: double.infinity,
          maxWidth: 400,
          maxHeight: 400,
        ),
        child: Container(
          width: 500,
          height: 300,
          color: Colors.red,
        ),
      ),
    );
  }
}
