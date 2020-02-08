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
  var currentCity;
  var cities = [
    DropdownMenuItem(child: Text('北京'), value: 'beijing'),
    DropdownMenuItem(child: Text('上海'), value: 'shanghai'),
    DropdownMenuItem(child: Text('广州'), value: 'guangzhou'),
    DropdownMenuItem(child: Text('深圳'), value: 'shenzhen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ch04-DropdownButton'),
        ),
        body: Column(
          children: <Widget>[
            DropdownButton(
              hint: Text('请选择城市'),
              value: currentCity,
              items: cities,
              onChanged: (val) {
                print(val + ' seleced');
                setState(() {
                  this.currentCity = val;
                });
              },
            )
          ],
        )
    );
  }
}
