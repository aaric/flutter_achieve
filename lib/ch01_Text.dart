import 'package:flutter/cupertino.dart';
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
    const _myTextStyle = TextStyle(
        color: const Color(0xffff0000),
        fontFamily: 'Microsoft YaHei',
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ch01-Text'),
      ),
      body: Column(
        children: <Widget>[
          Text('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptatibus doloremque ut at itaque asperiores adipisci ducimus mollitia voluptatem aspernatur eos, vitae voluptate aliquid rem beatae, atque praesentium dicta velit fuga.',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.2,
          ),
          Text('Hello World',
            style: _myTextStyle,
          ),
          Text.rich(
            TextSpan(
                children: [
                  TextSpan(
                    text: '百度：',
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  TextSpan(
                    text: 'https://www.baidu.com',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid
                    )
                  ),
                ]
            )
          )
        ],
      )
    );
  }
}
