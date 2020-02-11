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
          title: Text('ch03-Image'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                print('Settings clicked');
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Image.asset('images/panda.jpg',
              fit: BoxFit.cover,
            ),
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',
              color: Colors.yellow,
              colorBlendMode: BlendMode.darken,
            ),
            Icon(Icons.alarm),
            Icon(MyFont.huawei,
              color: Colors.red,
            ),
            Icon(MyFont.xiaomi),
            Icon(MyFont.oppo),
          ],
        )
    );
  }
}
