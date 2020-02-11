import 'package:flutter/material.dart';
import 'my_font.dart';

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
          title: Text('ch17-Scaffold'),
          actions: <Widget>[
            IconButton(
              icon: Icon(MyFont.huawei),
              onPressed: () {
                print('huawei');
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Text('Hello World')
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_airport),
              title: Text('airplane')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.train),
                title: Text('train')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus),
                title: Text('bus')
            ),
          ],
        ),
    );
  }
}
