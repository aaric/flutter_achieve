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
          title: Text('ch23-Navigator'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go to HelloPage'),
              onPressed: () async {
                String result = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HelloPage()
                ));
                print('callback: $result');
              },
            )
          ],
        )
    );
  }
}

class HelloPage extends StatefulWidget {
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HelloPage'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Go back'),
            onPressed: () {
              Navigator.pop(context, 'hello world');
            },
          )
        ]
      )
    );
  }
}

