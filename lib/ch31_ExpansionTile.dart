import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        title: Text('ch31-ExpansionTile'),
      ),
      body: Center(
        child: ExpansionTile(
          backgroundColor: Colors.white12,
          title: Text('Notification'),
          leading: Icon(Icons.notifications_active),
          initiallyExpanded: true,
          children: <Widget>[
            ListTile(
              title: Text('Title'),
              subtitle: Text('Sub Title'),
            )
          ],
        ),
      ),
    );
  }
}

