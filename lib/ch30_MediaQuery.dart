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
  List<Widget> _widgetList;

  @override
  void initState() {
    super.initState();
    _widgetList = new List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('ch30-MediaQuery'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            color: Colors.grey,
            width: screenWidth,
            height: screenHeight-80,
            child: Wrap(
              spacing: (screenWidth - 300) / 3,
              children: _widgetList,
            ),
          ),
        )
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _widgetList.insert(_widgetList.length - 1, buildFakePhoto());
        });
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildFakePhoto() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
        child: Center(
          child: Text('照片',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}

