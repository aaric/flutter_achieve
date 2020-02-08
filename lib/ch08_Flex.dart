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
          title: Text('ch08-Flex'),
        ),
        body: Flex(
          //direction: Axis.horizontal,
          direction: Axis.vertical,
          children: <Widget>[
            Container(//banner
              height: 50,
              color: Colors.red
            ),
            Expanded(//content
                flex: 1,
                child: Container(
                    color: Colors.orange
                )
            ),
            Container(//footer
                height: 50,
                color: Colors.green
            )
          ],
        )
    );
  }
}
